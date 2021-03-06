class OrderForm
	include ActiveModel::Model

	attr_accessor(
		:success, # Indicates whether the save was successfull
		:order, # Order instance
		:user,
		:event_id,
		:checkout,
		:order_items, # List of Order Item Form
		:payment # The order payment form
	)

	validates :user, presence: true
	validates :event_id, presence: true
	validate :payment_valid, if: Proc.new { |order_form| !order_form.order.free? }
	validate :order_items_valid

	def initialize(attributes={})
		super
		@order_items ||= []
		@order = Order.new(event_id: event_id, order_items_attributes: build_order_items_attributes)
		unless @order.free?
			@payment ||= PaymentForm.new
		end
	end

	def save
		begin
			if valid?
				persist_order!
				unless @order.free?
					@checkout = Wirecard::Checkout.new(@order, payment)
					@checkout.process!
					persist_order_payment!
				end
				@success = true
			end
		rescue CheckoutErrors::OrderError, CheckoutErrors::PaymentError => e
			self.errors.add(:checkout, e.message)
			@order.destroy
			@success = false
		rescue => e
			self.errors.add(:base, e.message)
			@order_payment.destroy if @order_payment.present? && @order_payment.persisted?
			@order.destroy if @order.present? && @order.persisted?
			@success = false
		end		
	end

	def order_items_attributes=(order_items_params)
		@order_items ||= []
		order_items_params.each do |i, order_item_params|
			if order_item_params["quantity"].to_i > 0
				@order_items.push(OrderItemForm.new(order_item_params))
			end
		end
	end

	def payment_attributes=(payment_params)
		@payment = PaymentForm.new(payment_params)
	end

	private

		def persist_order!
			@order.user = user
			@order.save!
		end

		def persist_order_payment!
			@order_payment = OrderPayment.new({
				order: @order,
				amount_cents: @checkout.wirecard_payment.amount.total,
				installment_count: @checkout.wirecard_payment.installment_count,
				interest_rate: Business::Finance::InterestRate[@checkout.wirecard_payment.installment_count],
				card_brand: @checkout.wirecard_payment.funding_instrument.credit_card.brand,
				card_number_last_4: @checkout.wirecard_payment.funding_instrument.credit_card.last4
			})
			@order_payment.save!
		end

		def build_order_items_attributes
			order_items.map do |order_item|
				order_item.serializable_hash
			end
		end

		def payment_valid
			if payment.nil?
				self.errors.add(:base, "Payment can't be blank.")
			elsif payment.invalid?
				payment.errors.full_messages.each do |full_message|
					self.errors.add(:base, full_message)
				end
			end
		end

		def order_items_valid
			if order_items.empty?
				self.errors.add(:base, "Order items can't be empty.")
			else
				order_items.each do |order_item|
					next if order_item.valid?
					order_item.errors.full_messages.each do |full_message|
						self.errors.add(:base, full_message)
					end
				end
			end
		end
end