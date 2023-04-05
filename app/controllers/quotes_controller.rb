class QuotesController < ApplicationController

  def new
    @avancement = true
    @step = 2
    @quote = Quote.find_by(customer_id: params[:customer_id], user_id: current_user.id)
  end

  def comparaison
    @avancement = true
    @step = 2
    @quote = Quote.find_by(customer_id: params[:customer_id], user_id: current_user.id)
  end

  def signature
    @quote = Quote.find(params[:id])
    @expert = current_user
    @assure = Customer.find @quote.customer_id
    @police_cinq_million = @assure.contracts.first.police_cinq_million
    @primary_contact = @assure.primary_contacts.first
    @chosen = params[:chosen] ? params[:chosen] : "normal"
    p 'on estr al'
    p params
    render layout: 'signature'

  end

  def pdf
        p 'on estr al'
    p params
    @quote = Quote.find(params[:id])
    @expert = current_user
    @assure = Customer.find @quote.customer_id
    @police_cinq_million = @assure.contracts.first.police_cinq_million
    @primary_contact = @assure.primary_contacts.first
    @chosen = params[:chosen] ? params[:chosen] : "normal"
    respond_to do |format|
      format.html do
        render layout: 'pdf.html.erb'
      end
      format.pdf do
        render pdf: "Contrat",
              template: "quotes/pdf.html.erb",
              layout: 'pdf.html',
              formats: :html, encoding: 'utf8'
      end
    end
  end

end
