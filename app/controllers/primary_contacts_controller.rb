class PrimaryContactsController < ApplicationController
def new
  @avancement = true
  @step = 1
  @customer = Customer.find(params[:customer_id])
  #  CAR DEMO c'est rempli
  primary_contact = @customer.primary_contacts.last
  @primary_contact = PrimaryContact.new(
    first_name: primary_contact.first_name,
    last_name: primary_contact.last_name,
    position: primary_contact.position,
    tel: primary_contact.tel,
    email: primary_contact.email
  )
  # EN MARCHE
  # @primary_contact = PrimaryContact.new()
end

def create
  # EN MARCHE :
  # @customer = Customer.find(params[:customer_id])
  # @primary_contact = PrimaryContact.new(primary_contact_params)
  # @contract = Contract.new
  # @primary_contact.customer = @customer
  # if @primary_contact.save
  #   redirect_to new_customer_contract_path(@customer)
  # else
  #   render 'new'
  # end

  #  DEMO :
  @customer = Customer.find(params[:customer_id])
  @primary_contact = @customer.primary_contacts.last
  @contract = Contract.where(customer_id: @customer.id).take
  redirect_to controller: 'police_cinq_millions', action: 'new', contract_id: @contract.id , customer_id: @contract.customer.id
end

private

def primary_contact_params
  params.require(:primary_contact).permit(:last_name, :first_name, :position, :tel, :email)
end

end
