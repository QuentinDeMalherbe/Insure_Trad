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
      # mettre qq chose
    else
      render 'new'
    end
  end

  private

  def gestion_params
    params.require(:gestion).permit(:cgi, :logiciel, :document, :client_info, :client_solvabilite, :client_limit, :calcul_client_limit, :limit_time_payback)
  end
end
