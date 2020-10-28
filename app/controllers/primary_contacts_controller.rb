class PrimaryContactsController < ApplicationController
def new
  @customer = Customer.find(params[:customer_id])
  @primary_contact = PrimaryContact.new
end

def create
  @customer = Customer.find(params[:customer_id])
  @primary_contact = PrimaryContact.new(primary_contact_params)
  @contract = Contract.new
  @primary_contact.customer = @customer
  if @primary_contact.save
    # redirect_to new_customer_contract_path(@customer, @contract)
    redirect_to controller: 'contracts', action: 'new', customer_id: @customer.id
  else
    render 'new'
  end
end

private

def primary_contact_params
  params.require(:primary_contact).permit(:last_name, :first_name, :position, :tel, :email)
end

end
