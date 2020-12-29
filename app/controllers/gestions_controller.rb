class GestionsController < ApplicationController
  def new
    @police = PoliceXol.find(params[:police_xol_id])
    @gestion = Gestion.new

  end

  def create
    @police = PoliceXol.find(params[:police_xol_id])
    @gestion = Gestion.new(gestion_params)
    @gestion.police_xol = @police
    if @gestion.save
      if @police.montant_min == false
        redirect_to montant_important_path(@police)
      else
        redirect_to new_police_xol_nbi_path(@police)
      end
    else
      render 'new'
    end
  end

  private

  def gestion_params
    params.require(:gestion).permit(:cgi, :logiciel, :document, :client_info, :client_solvabilite, :client_limit, :calcul_client_limit, :limit_time_payback)
  end
end
