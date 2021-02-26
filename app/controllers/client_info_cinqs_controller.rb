class ClientInfoCinqsController < ApplicationController
  def new
    @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
    @info = ClientInfoCinq.new
  end

  def create
    @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
    @info = ClientInfoCinq.new(info_params)
    @info.police_cinq_million = @police_cinq_million
    if @info.save
      redirect_to  new_police_cinq_million_nbi_cinq_un_path(@police_cinq_million)
    else
      render new_police_cinq_million_nbi_cinq_un_path(@police_cinq_million)
    end
  end

  private

  def info_params
    params.require(:client_info_cinq).permit(:name, :address, :city, :zip_code, :num_identification, :terme_paiement,
      :anciennete, :regularite, :experience, :facture_impayee)
  end

    #   t.string "name"
    # t.string "address"
    # t.string "city"
    # t.string "zip_code"
    # t.string "num_identification"
    # t.string "terme_paiement"
    # t.string "anciennete"
    # t.string "regularite"
    # t.string "experience"
    # t.string "facture_impayee"
    # t.bigint "police_cinq_million_id", null: false

end
