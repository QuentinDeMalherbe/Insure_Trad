class RisksController < ApplicationController

  def search
    @consumers =Consumer.all
    @hide = true
    if params[:search].present?
      @hide = false
      %i[name siret].each do |filter|
        next unless params[:search][filter].present?

        @consumers = @consumers.public_send("#{filter}_search", params[:search][filter])
      end
    end
  end

  def result
    @consumer = Consumer.find params[:consumer_id]
    @allowed = @consumer.risk_allowed
  end
end
