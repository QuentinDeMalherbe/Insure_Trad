class NbiCinqMultiplesController < ApplicationController
  def new
    @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
    @nbi_cimq_multiple = NbiCinqMultiple.new
  end

end
