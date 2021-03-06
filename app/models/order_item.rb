class OrderItem < ApplicationRecord
  before_save :update_offer_quantity, if: :new_record?

  belongs_to :offer
  belongs_to :order
  has_many :ticket_tokens, dependent: :destroy
  has_one :event, through: :offer
  has_one :user, through: :order

  accepts_nested_attributes_for :ticket_tokens
  accepts_nested_attributes_for :offer

  scope :free, -> { joins(:offer).merge(Offer.free) }
  scope :costly, -> { joins(:offer).merge(Offer.costly) }

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :offer_event_cannot_be_different_to_order_event
  validate :quantity_cannot_be_different_to_ticket_tokens_count
  validate :quantity_cannot_be_greater_than_offer_available_quantity, on: :create
  validate :offer_cannot_be_unavailable, on: :create

  before_destroy :cancel

  def cancel
    offer.sold -= self.quantity
    offer.save
  end

  private

    def update_offer_quantity
      offer.sold += self.quantity
    end

    def quantity_cannot_be_greater_than_offer_available_quantity
      if offer.present? && self.quantity > offer.available_quantity
        errors.add(:quantity, :sold_out, message: "can't be greater than offer available quantity")
      end
    end

    def quantity_cannot_be_different_to_ticket_tokens_count
      if ticket_tokens.not_cancelled.present? && self.quantity != ticket_tokens.not_cancelled.length
        errors.add(:quantity, "can't mismatch the number of valid and used ticket tokens")
      end
    end

    def offer_event_cannot_be_different_to_order_event
      if event != order.event
        errors.add(:event, "one order can't have order items related to different events")
      end
    end

    def offer_cannot_be_unavailable
      if offer.unavailable?
        errors.add(:offer, "offer cannot be unavailable.")
      end
    end

end
