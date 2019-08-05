class ProducerAdmin::OffersController < ApplicationController
	def index
		@event = Event.find(params[:event_id])
		@offers = @event.offers.order(created_at: :desc)
	end
end
