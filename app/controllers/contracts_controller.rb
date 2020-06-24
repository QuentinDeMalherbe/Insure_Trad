class ContractsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @customer = Customer.find(params[:customer_id])
    @contract.customer = @customer
    @contract.user = current_user
    @insure_trade_type = InsureTradSupp.new
    if @contract.save
      redirect_to new_contract_insure_trad_supp_path(@contract, @insure_trade_type)
    else
      render 'new'
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:insure_trade_type)
  end
end
