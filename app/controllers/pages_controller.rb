class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :intermediaire, :assure]

  def home
    if current_user && current_user.status == "expert"
      redirect_to profiles_intermediaire_home_path
    elsif current_user && current_user.status == "assure"
      redirect_to profiles_insured_home_path
    else
      render layout: "homepage"
    end
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
