class NbiCinqUnsController < ApplicationController
  def new
    @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
    if @police_cinq_million.client_info_cinq
      @client_info_cinq = ClientInfoCinq.find(@police_cinq_million.client_info_cinq.id)
    else
      @client_info_cinq = ClientInfoCinq.new
      @client_info_cinq.police_cinq_million = @police_cinq_million
    end
    @nbi_cinq_un = NbiCinqUn.new
    unless @police_cinq_million.client_name.nil?
      @nbi_cinq_un.client_name = @police_cinq_million.client_name
      client_creation @police_cinq_million
      @client_info_cinq.name = @police_cinq_million.client_name
    end
  end

  def create
    @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
    @nbi_cinq_un = NbiCinqUn.new(nbi_params)
    @nbi_cinq_un.police_cinq_million = @police_cinq_million
    if @nbi_cinq_un.save
      flash[:success] = "Object successfully created"
      redirect_to @nbi_cinq_un
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end


  def client_creation(police)
    @information = {}
    @information[:client_name] = police.client_name
    @information[:grade] = NbiCinqUn::CLIENT_AND_GRADE[police.client_name.to_sym]
    @information[:montant_perte_base] = NbiCinqUn.montant_perte_base(@information[:grade], police)
    @information[:quotite_base] = NbiCinqUn.quotite_base(@information[:grade])
    @information[:duree_base] = NbiCinqUn.duree_base(@information[:grade])
    @information[:montant_perte_complementaire] = NbiCinqUn.montant_perte_complementaire(@information[:grade], police)
    @information[:montant_forfait_base] = NbiCinqUn.montant_forfait_base(@information[:grade], police, @information[:montant_perte_base])
    @information[:montant_forfait_complemmentaire] = NbiCinqUn.montant_forfait_complementaire(@information[:grade], police )
  end

  private

  def nbi_params
    params.require(:nbi_cinq_un).permit(:client_name, :grade, :montant_perte_base, :quotite_base, :duree_base, :montant_perte_complementaire, :montant_forfait_base, :montant_forfait_complemmentaire)
  end

end
