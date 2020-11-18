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
    default_values(@police)
    if @police.save
      flash[:success] = "blah"
      redirect_to new_police_xol_police_xol_b_path(@police)
    else
      4.times { @police.historic_losses_as.build }
      4.times { @police.main_customer_as.build }
      render :new
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

  def historics
    now = Date.today
    return {
      historic_1: {
        start_date: Date.new(now.year, 1, 1),
        end_date: now
      },
      historic_2: {
        start_date: Date.new(now.year - 1, 1, 1),
        end_date: Date.new(now.year - 1, 12, 31)
      },
      historic_3: {
        start_date: Date.new(now.year - 2, 1, 1),
        end_date: Date.new(now.year - 2, 12, 31)
      },
      historic_4: {
        start_date: Date.new(now.year - 3, 1, 1),
        end_date: Date.new(now.year - 3, 12, 31)
      }
    }
  end

  def  default_values(police)
    police.historic_losses_as.first.start_date = historics[:historic_1][:start_date] unless police.historic_losses_as.first.nil?
    police.historic_losses_as.first.end_date = historics[:historic_1][:end_date] unless police.historic_losses_as.first.nil?
    police.historic_losses_as.second.start_date = historics[:historic_2][:start_date] unless police.historic_losses_as.second.nil?
    police.historic_losses_as.second.end_date = historics[:historic_2][:end_date] unless police.historic_losses_as.second.nil?
    police.historic_losses_as.third.start_date = historics[:historic_3][:start_date] unless police.historic_losses_as.third.nil?
    police.historic_losses_as.third.end_date = historics[:historic_3][:end_date] unless police.historic_losses_as.third.nil?
    police.historic_losses_as.fourth.start_date = historics[:historic_4][:start_date] unless police.historic_losses_as.fourth.nil?
    police.historic_losses_as.fourth.end_date = historics[:historic_4][:end_date] unless police.historic_losses_as.fourth.nil?
  end
end
