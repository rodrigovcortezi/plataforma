class TicketToken < ApplicationRecord
  belongs_to :ticket
  belongs_to :order
  belongs_to :ticket_status
  has_one :validation
end
