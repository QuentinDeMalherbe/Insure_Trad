class CustomerContactsController < ApplicationController
  def new
    @customer_contact = CustomerContact.new
    # @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
    # @customer_contact.insure_trad_supp = @insure_trad_supp
  end

  def create
    @customer_contact = CustomerContact.new(customers_contact_params)
    if params[:insure_trad_supp_id]
      @insure_trad_supp = InsureTradSupp.find(params[:insure_trad_supp_id])
      @customer_contact.insure_trad_supp = @insure_trad_supp
      @customer = @insure_trad_supp.contract.customer
    elsif
      p '-----------'
      p params
      p '-----------'
      p params[:police_cinq_million_id]
      p '----------'
      @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
      @customer_contact.police_cinq_million = @police_cinq_million
      @customer = @police_cinq_million.contract.customer
    end
    @primary_contact = PrimaryContact.where(customer_id: @customer.id).last
    if params[:insure_trad_supp_id] && @customer_contact.save
      redirect_to @insure_trad_supp
    elsif params[:insure_trad_supp_id]
      render 'insure_trad_supps/show'
    elsif params[:police_cinq_million_id] && @customer_contact.save
      redirect_to @police_cinq_million
    elsif
      render 'nbi_cinq_multiples/show'
    end
  end

  private

  def customers_contact_params
    params.require(:customer_contact).permit(:last_name_contact, :last_name_dirigeant, :last_name_correspondance, :position_contact, :position_dirigeant, :position_correspondance, :email_contact, :email_dirigeant, :email_correspondance, :tel_contact, :tel_dirigeant, :tel_correspondance)
  end
end
