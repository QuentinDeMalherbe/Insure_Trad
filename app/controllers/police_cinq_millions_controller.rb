class PoliceCinqMillionsController < ApplicationController
  def new
    @avancement = true
    @step = 2
    @contract = Contract.find(params[:contract_id])
    @police_cinq_million = PoliceCinqMillion.new
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @police_cinq_million = PoliceCinqMillion.new(police_params)
    @police_cinq_million.contract = @contract
    if @police_cinq_million.save && @police_cinq_million.client_number == 1
      redirect_to  new_police_cinq_million_nbi_cinq_un_path(@police_cinq_million)
    elsif  @police_cinq_million.save && @police_cinq_million.client_number > 1
      redirect_to  new_police_cinq_million_nbi_cinq_multiple_path(@police_cinq_million)
    else
      render :new
    end
  end

  def update
    @police_cinq_million = PoliceCinqMillion.find(params[:id])
    if @police_cinq_million.update_attributes(police_params_update)
      redirect_to new_police_cinq_million_nbi_cinq_un_path(@police_cinq_million)
    end
  end

  def show
    @avancement = true
    @step = 4
    @police_cinq_million = PoliceCinqMillion.find(params[:id])
  end

  def creationpdf
    @police_cinq_million = PoliceCinqMillion.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Contrat",
               template: "police_cinq_millions/creationpdf.html.erb",
               layout: 'pdf.html',
               formats: :html, encoding: 'utf8'
      end
    end
  end


  private

  def police_params
    params.require(:police_cinq_million).permit(:ammount_ca, :client_number, :max_loss)
  end

  def police_params_update
    params.require(:police_cinq_million).permit(:client_name)
  end

end
