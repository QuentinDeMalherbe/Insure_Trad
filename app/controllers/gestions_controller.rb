class GestionsController < ApplicationController
  def new
    @gestion = Gestion.new
  end

end
