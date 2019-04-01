class Order < ApplicationRecord
  enum status: { pending: "pending", approved: "approved", denied: "denied", refunded: "refunded" }
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_one :payment, class_name: :OrderPayment, dependent: :destroy
  belongs_to :event
  has_one :company, through: :event
  has_many :offers, through: :order_items
  has_many :ticket_tokens, through: :order_items

  before_create :generate_order_number
  before_save :update_subtotal
  after_initialize :default_values

  accepts_nested_attributes_for :order_items
  validates_associated :order_items

  monetize :subtotal_cents
  monetize :total_cents
  monetize :absolute_fee_cents

  def subtotal_cents
    order_items.collect { |order_item| order_item.quantity * order_item.offer.price_cents }.sum
  end

  def total_cents
    subtotal_cents + absolute_fee_cents
  end

  def absolute_fee_cents
    if payment.present?
      payment.service_fee * subtotal_cents
    else
      Business::Finance::ServiceFee * subtotal_cents
    end
  end

  def total_quantity
    order_items.collect { |order_item| order_item.quantity }.sum
  end

  def approved!
    super
    ticket_tokens.each do |ticket_token|
      if ticket_token.pending?
        ticket_token.ready!
      end
    end
  end

  def denied!
    ticket_tokens.each do |ticket_token|
      if ticket_token.pending?
        ticket_token.cancelled!
      end
    end
    order_items.each do |order_item|
      order_item.cancel
    end
    super
  end

  def refunded!
    ticket_tokens.each do |ticket_token|
        ticket_token.cancelled!
    end
    order_items.each do |order_item|
      order_item.cancel
    end
    super
  end

  def self.to_csv 
    attributes = %w{number total_quantity total status}

    CSV.generate(headers: true) do |csv|
      csv << ["name"] + attributes

      all.each do |order|
        csv << [order.user.name] + attributes.map{ |attr| order.send(attr) }
      end
    end
  end

  private

    def default_values
      self.status ||= :pending
    end

    def generate_order_number
      now = DateTime.now
      year = (now.year % 100).to_s
      month = now.month.to_s.rjust(2, "0")
      day = now.day.to_s.rjust(2, "0")

      order_date = year + month + day

      loop do
        random_code = rand(10 ** 6).to_s.rjust(7, "0")
        self.number = order_date + random_code
        break unless Order.exists?(number: self.number)
      end
    end

    def update_subtotal
      self.subtotal_cents = subtotal_cents
    end

end
