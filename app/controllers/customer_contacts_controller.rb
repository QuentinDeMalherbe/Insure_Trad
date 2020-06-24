class CustomerContactsController < ApplicationController
  def new
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @customer_contact = CustomerContact.new
    @customer_contact.insure_trad_supp = @insure_trad_supp
  end

  def create
    @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    @customer_contact = CustomerContact.new(customers_contact_params)
    @customer_contact.insure_trad_supp = @insure_trad_supp
    if @customer_contact.save
      redirect_to @insure_trad_supp
    else
    render 'insure_trad_supps/show'
    end
  end

  private

  def customers_contact_params
    params.require(:customer_contact).permit(:last_name_contact, :last_name_dirigeant, :last_name_correspondance, :position_contact, :position_dirigeant, :position_correspondance, :email_contact, :email_dirigeant, :email_correspondance, :tel_contact, :tel_dirigeant, :tel_correspondance)
  end
end
