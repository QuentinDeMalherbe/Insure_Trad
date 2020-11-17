class PoliceXolsController < ApplicationController
  def new
    @contract = Contract.find(params[:contract_id])
    @police = PoliceXol.new
    4.times { @police.historic_losses_as.build }
    4.times { @police.main_customer_as.build }
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @police = PoliceXol.new(police_params)
    @police.contract = @contract
    if @police.save
      flash[:success] = "blah"
      redirect_to @police
    else
      p 'coucou'
      render 'new'
    end
  end

    private

  def police_params
      params.require(:police_xol).permit(
        :amount_ca_nat, :amount_ca_nat_else, :amount_ca_export_a, :client_number, :delai_max, :dso,
        historic_losses_as_attributes: [:id, :start_date, :end_date, :amount_loss, :number_client, :max_loss, :_destroy],
        main_customer_as_attributes: [:id, :name, :address, :zip_code, :city, :country, :siret, :percent_ca, :_destroy ]
      )
  end
end
