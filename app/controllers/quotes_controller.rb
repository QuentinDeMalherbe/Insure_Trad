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

end
