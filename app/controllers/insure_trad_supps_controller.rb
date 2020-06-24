class InsureTradSuppsController < ApplicationController
  def show
    @insure_trad_supp = InsureTradSupp.find(params[:id])
    if @insure_trad_supp.customers_info
      @customers_info = CustomersInfo.find(@insure_trad_supp.customers_info.id)
    else
      @customers_info = CustomersInfo.new
      @customers_info.insure_trad_supp = @insure_trad_supp
    end
    if @insure_trad_supp.customer_contact
      @customer_contact = CustomerContact.find(@insure_trad_supp.customer_contact.id)
    else
      @customer_contact = CustomerContact.new
      @customer_contact.insure_trad_supp = @insure_trad_supp
    end
    if @insure_trad_supp.primary_insurance
      @primary_insurance = PrimaryInsurance.find(@insure_trad_supp.primary_insurance.id)
    else
      @primary_insurance = PrimaryInsurance.new
      @primary_insurance.insure_trad_supp = @insure_trad_supp
    end
  end

  def new
    @contract = Contract.find(params[:contract_id])
    @insure_trad_supp = InsureTradSupp.new
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @insure_trad_supp = InsureTradSupp.new(insure_trad_supp_params)
    @insure_trad_supp.contract = @contract
    if @insure_trad_supp.save
      redirect_to new_insure_trad_supp_option_path(@insure_trad_supp)
    else
      render :new
    end
  end

  def creationpdf
    @insure_trad_supp = InsureTradSupp.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Contrat",
        template: "insure_trad_supps/creationpdf.html.erb",
        layout: 'pdf.html',
        formats: :html, encoding: 'utf8'
      end
    end
end

  private

  def insure_trad_supp_params
    params.require(:insure_trad_supp).permit(:amountCA, :percentCA, :percentBadlyCovert, :numberTotalInsured)
  end
end
