class PoliceXolBsController < ApplicationController
  def new
    @police = PoliceXol.find(params[:police_xol_id])
    @police_b = PoliceXolB.new
    4.times { @police_b.historic_losses_bs.build }
    2.times { @police_b.main_customer_bs.build }
  end

  def create
    @police = PoliceXol.find(params[:police_xol_id])
    @police_b = PoliceXolB.new(police_b_params)
    @police_b.police_xol = @police
    default_values(@police_b)
    if @police_b.save
      flash[:success] = "blah"
      redirect_to new_police_xol_gestion_path(@police)
    else
      4.times { @police_b.historic_losses_bs.build }
      2.times { @police_b.main_customer_bs.build }
      render :new
    end
  end

private

  def police_b_params
      params.require(:police_xol_b).permit(
        :amount_ca_export_b, :amount_ca_export_c, :client_number, :delai_max, :dso,
        historic_losses_bs_attributes: [:id, :start_date, :end_date, :amount_loss, :number_client, :max_loss, :_destroy],
        main_customer_bs_attributes: [:id, :name, :address, :zip_code, :city, :country, :siret, :percent_ca, :_destroy ]
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
    police.historic_losses_bs.first.start_date = historics[:historic_1][:start_date] unless police.historic_losses_bs.first.nil?
    police.historic_losses_bs.first.end_date = historics[:historic_1][:end_date] unless police.historic_losses_bs.first.nil?
    police.historic_losses_bs.second.start_date = historics[:historic_2][:start_date] unless police.historic_losses_bs.second.nil?
    police.historic_losses_bs.second.end_date = historics[:historic_2][:end_date] unless police.historic_losses_bs.second.nil?
    police.historic_losses_bs.third.start_date = historics[:historic_3][:start_date] unless police.historic_losses_bs.third.nil?
    police.historic_losses_bs.third.end_date = historics[:historic_3][:end_date] unless police.historic_losses_bs.third.nil?
    police.historic_losses_bs.fourth.start_date = historics[:historic_4][:start_date] unless police.historic_losses_bs.fourth.nil?
    police.historic_losses_bs.fourth.end_date = historics[:historic_4][:end_date] unless police.historic_losses_bs.fourth.nil?
  end

end
