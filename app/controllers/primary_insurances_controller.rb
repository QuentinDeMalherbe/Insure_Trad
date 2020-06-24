class PrimaryInsurancesController < ApplicationController
    def new
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @primary_insurance = PrimaryInsurance.new
    @primary_insurance.insure_trad_supp = @insure_trad_supp
  end


  def create
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @primary_insurance = PrimaryInsurance.new(primary_insurance_params)
    @primary_insurance.insure_trad_supp = @insure_trad_supp
    if @primary_insurance.save
      if @primary_insurance.loss_payee == 0
        redirect_to @insure_trad_supp
      else
        redirect_to new_primary_insurance_loss_payee_path(@primary_insurance)
      end

    else
      flash[:error] = "Something went wrong"
      render 'insure_trad_supps/show'
    end
  end

    private

    def primary_insurance_params
      params.require(:primary_insurance).permit(:name_insurer, :policy_number, :policy_period_start, :policy_period_end, :intermediaire, :loss_payee)
    end
end
