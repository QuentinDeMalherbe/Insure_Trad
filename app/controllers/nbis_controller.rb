class NbisController < ApplicationController
  def new
    @police = PoliceXol.find(params[:police_xol_id])
    @nbi = Nbi.new(police_xol: @police)
  end

  def create
    @police = PoliceXol.find(params[:police_xol_id])
    @nbi = Nbi.new(nbi_params)
    if @nbi.save
      creation_police_path(@police)
    else
      render :new
    end
  end

  def creationpdf

  end

  private

  def nbi_params
    params.require(:nbi).permit(
      # lister les params
    )
  end
end
