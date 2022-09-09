class NbiCinqMultiplesController < ApplicationController
  def new
    @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
    @nbi_cimq_multiple = NbiCinqMultiple.new
    p params
    client_creation @police_cinq_million
  end

  def create
    @police_cinq_million = PoliceCinqMillion.find(params[:police_cinq_million_id])
    @nbi_cimq_multiple = NbiCinqMultiple.new(nbi_params)
    @nbi_cimq_multiple.police_cinq_million = @police_cinq_million
    if @nbi_cimq_multiple.save
      flash[:success] = "Object successfully created"
      redirect_to @nbi_cimq_multiple
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @nbi_cinq_multiple = NbiCinqMultiple.find(params[:id])
    @police_cinq_million = @nbi_cinq_multiple.police_cinq_million
    if @police_cinq_million.customer_contact
      @customer_contact = CustomerContact.find(@police_cinq_million.customer_contact.id)
    else
      @customer_contact = CustomerContact.new
      @customer = @police_cinq_million.contract.customer
      @primary_contact = PrimaryContact.where(customer_id: @customer.id).last
      #  pas optimal mais  a reflechir
      # @customer_contact.police_cinq_million = @nbi_cinq_multiple
    end

  end


  def client_creation(police)
    @information = {}
    @information[:impaye] = NbiCinqMultiple.impaye(police)
    @information[:cumul_impaye] = NbiCinqMultiple.cumul_impaye(@information[:impaye])
    @information[:franchise_option_1] = 0
    @information[:franchise_option_2] = NbiCinqMultiple.franchise_option_2(@information[:impaye])
    @information[:franchise_option_3] = NbiCinqMultiple.franchise_option_3(@information[:impaye])
    @information[:garantie_1_5] = police.max_loss
    @information[:garantie_6] = police.max_loss * 0.5
    @information[:garantie_7] = police.max_loss * 0.25
    @information[:nombre_grade] = NbiCinqMultiple.grade_risque(police.client_number)
    @information[:plafond_annuel] = police.max_loss * 1.5 + @information[:cumul_impaye]
    # f21
    @information[:prime_annuelle_1] = NbiCinqMultiple.prime_annuelle_1(police, @information[:plafond_annuel] )
    @information[:prime_annuelle_2] = @information[:prime_annuelle_1] - @information[:franchise_option_2]
    @information[:prime_annuelle_3] = @information[:prime_annuelle_1] - @information[:franchise_option_3]
    # f24
    @information[:cout_police] = 100 + (@information[:nombre_grade]  * 20)
    @information[:minimum_prime_1] = (@information[:prime_annuelle_1] * 3).to_f / 12 + @information[:cout_police]
    @information[:minimum_prime_2] = (@information[:prime_annuelle_2] * 3).to_f / 12 + @information[:cout_police]
    @information[:minimum_prime_3] = (@information[:prime_annuelle_3] * 3).to_f / 12 + @information[:cout_police]
    @information[:echeance_mensuelle_1] = (@information[:prime_annuelle_1] * 9).to_f / (12 * 11)
    @information[:echeance_mensuelle_2] = (@information[:prime_annuelle_2] * 9).to_f / (12 * 11)
    @information[:echeance_mensuelle_3] = (@information[:prime_annuelle_3] * 9).to_f / (12 * 11)
  end

  private

  def nbi_params
    params.require(:nbi_cinq_multiple).permit(
      :impaye,
      :cumul_impaye,
      :franchise_option,
      :garantie_1_5,
      :garantie_6,
      :garantie_7,
      :nombre_grade,
      :plafond_annuel,
      :prime_annuelle,
      :cout_police,
      :minimum_prime,
      :echeance_mensuelle
    )
  end

end
