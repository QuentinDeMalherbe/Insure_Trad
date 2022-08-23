class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :intermediaire, :assure]

  def home
    render layout: "homepage"
  end

  def intermediaire
    render layout: "homepage"
    p current_user
  end

  def assure
    render layout: "homepage"
    p current_user
  end
end
