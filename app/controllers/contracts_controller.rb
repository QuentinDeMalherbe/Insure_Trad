class ContractsController < ApplicationController
  def new
    @avancement = true
    @step = 2
    @customer = Customer.find(params[:customer_id])
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @customer = Customer.find(params[:customer_id])
    @contract.customer = @customer
    @contract.user = current_user
    @insure_trade_type = InsureTradSupp.new
    if @contract.insure_trade_type == 2
      if @contract.save
        # redirect_to new_contract_insure_trad_supp_path(@contract, @insure_trade_type)
        redirect_to controller: 'insure_trad_supps', action: 'new', contract_id: @contract.id , customer_id: @contract.customer.id
      else
        render 'new'
      end
    elsif @contract.insure_trade_type == 1
      if @contract.save
        # redirect_to new_contract_insure_trad_supp_path(@contract, @insure_trade_type)
        redirect_to controller: 'police_xols', action: 'new', contract_id: @contract.id , customer_id: @contract.customer.id
      else
        render 'new'
      end
    elsif @contract.insure_trade_type.zero?
      if @contract.save
        redirect_to controller: 'police_cinq_millions', action: 'new', contract_id: @contract.id , customer_id: @contract.customer.id
      else
        render 'new'
      end
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:insure_trade_type)
  end
end
