class NbisController < ApplicationController
  def new
    @police = PoliceXol.find(params[:police_xol_id])
    @nbi = Nbi.new(police_xol: @police)
    @nbi.initialize_data
  end

  def create
    @police = PoliceXol.find(params[:police_xol_id])
    @nbi = Nbi.new(nbi_params)
    @nbi.police_xol = @police
    if @nbi.save
        redirect_to nbi_path([@police, @nbi])
      else
        render :new
      end
    end

  def show
    @nbi = Nbi.find(params[:id])
    @police = @nbi.police_xol
  end

  def creationpdf

  end

  private

  def nbi_params
    params.require(:nbi).permit(
      :montant_min,
      :garantie_1_6_z_1,
      :garantie_1_6_z_2,
      :garantie_1_6_z_3,
      :garantie_7_z_1,
      :garantie_7_z_2,
      :garantie_7_z_3,
      :plafond_annuel_garantie_z_1,
      :plafond_annuel_garantie_z_2,
      :plafond_annuel_garantie_z_3,
      :nbr_client_risque_z_1,
      :nbr_client_risque_z_2,
      :nbr_client_risque_z_3,
      :prime_annuelle_1,
      :cout_police_1,
      :plafond_annuelle_option,
      :cumul_annuel_3,
      :cumul_annuel_2,
      :cumul_annuel_1,
      :franchise_cumulee,
      :garantie_auto,
      :prime_annuelle_option,
      :cout_police_option
    )
  end
end
