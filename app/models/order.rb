class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  has_many :order_items
  has_one :payment
  has_many :events, through: :order_items
  has_many :offers, through: :order_items

  before_create :set_order_status
  before_create :generate_order_number
  before_save :update_subtotal

  accepts_nested_attributes_for :order_items

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.offer.price) : 0 }.sum
  end

  def event
    if self.new_record?
      order_items.first.offer.event
    else
      events.first
    end
  end

  def total_quantity
    order_items.collect { |oi| oi.valid? ? (oi.quantity) : 0 }.sum
  end

  private

    def generate_order_number
      now = DateTime.now
      year = (now.year % 100).to_s
      month = now.month.to_s.rjust(2, "0")
      day = now.day.to_s.rjust(2, "0")

      order_number = year + month + day

      loop do
        order_number += rand(10 ** 6).to_s.rjust(7, "0")
        order_number = order_number.to_i
        break unless Order.exists?(number: order_number)
      end

      self.number = order_number
    end

    def set_order_status
      self.order_status_id = 1
    end

    def update_subtotal
      self[:subtotal] = subtotal
    end

end
