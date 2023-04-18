class RisksController < ApplicationController

  def search
    @consumers =Consumer.all
    @hide = true
    @research = { }
    if params[:search].present?

      @hide = false
      %i[name siret].each do |filter|
        next unless params[:search][filter].present?

        @consumers = @consumers.public_send("#{filter}_search", params[:search][filter])
        @research = {
        siret: params[:search][:siret],
        name: params[:search][:name],
        country: params[:search][:country],
        address: params[:search][:address],
        zip_code: params[:search][:zip_code],
        city: params[:search][:city]
      }
      end
    end
  end

  def result
    @consumer = Consumer.find params[:consumer_id]
    @allowed = @consumer.risk_allowed
    @grade = @consumer.grade
  end
end
