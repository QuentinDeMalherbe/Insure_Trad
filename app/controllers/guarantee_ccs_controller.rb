class GuaranteeCcsController < ApplicationController

  def new

  end

  def search
    @consumers =Consumer.all
    @hide = true
    @research = { }
    if params[:search].present?
      @hide = false
      %i[name siret].each do |filter|
        next unless params[:search][filter].present?

        @consumers = @consumers.public_send("#{filter}_search", params[:search][filter])
      end
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

  def result
    if current_user.solde == 0
      redirect_to solde_assure_path(id: current_user.id)
    end
    @consumer = Consumer.find params[:consumer_id]
    @allowed = @consumer.risk_allowed
    @grade = @consumer.grade
  end

  def bought
    @bought = params[:bought]
    @consumer = Consumer.find params[:consumer_id]
    @grade = @consumer.grade
  end
end
