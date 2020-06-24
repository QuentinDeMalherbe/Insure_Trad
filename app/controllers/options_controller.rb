class OptionsController < ApplicationController
  def  new
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @option = Option.new
    @option.insure_trad_supp = @insure_trad_supp
    @options = @option.cumul_loses_insureds_and_max_auto_losss
    @option.policy_admin = @option.policy_admin_creation
  end

  def create
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @option = Option.new(options_params)
    @option.insure_trad_supp = @insure_trad_supp
    @option.policy_admin = @option.policy_admin_creation
    if @option.save
      redirect_to @insure_trad_supp
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def options_params
    params.require(:option).permit(:cumul_loses_insured, :max_auto_indiv_insured_loss, :annual_prenium, :quatrieme_layer, :troisieme_layer, :deuxieme_layer, :premier_layer  )
  end

end
