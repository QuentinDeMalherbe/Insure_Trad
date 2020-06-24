class CustomersInfosController < ApplicationController
  def new
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @customers_info = CustomersInfo.new
    @customers_info.insure_trad_supp = @insure_trad_supp
  end

  def create
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @customers_info = CustomersInfo.new(customers_info_params)
    @customers_info.insure_trad_supp = @insure_trad_supp
    if @customers_info.save
      redirect_to @insure_trad_supp
    else
      render 'insure_trad_supps/show'
    end
  end

    private

    def customers_info_params
      params.require(:customers_info).permit(:legalForm, :saleInsured, :compagny_name, :address, :zip_code, :city, :country, :activity_code, :siret)
    end
end
