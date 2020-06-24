class CustomersController < ApplicationController
  def index
    # mettre un pgsearch ici
    @customers = Customer.all
    if params[:search].present?
      @customers = @customers.search_by_compagny_name_and_siret(params[:search])
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @contract = Contract.new
    if @customer.update(customer_params)
      redirect_to new_customer_contract_path(@customer, @contract)
    else
      render_error
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:compagny_name, :address, :zip_code, :city, :country, :activity_code, :siret)
  end

end
