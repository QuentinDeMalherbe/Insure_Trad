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
    @primary_contact = PrimaryContact.new
  end

  def update
    @customer = Customer.find(params[:id])
    @primary_contact = PrimaryContact.new
    if @customer.update(customer_params)
      # redirect_to new_customer_primary_contact_path(@customer, @primary_contact)
      redirect_to controller: 'primary_contacts', action: 'new', customer_id: @customer.id
    else
      render_error
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:compagny_name, :address, :zip_code, :city, :country, :activity_code, :siret)
  end

end
