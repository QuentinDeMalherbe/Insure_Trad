class LossPayeesController < ApplicationController
    def new
    @primary_insurance = PrimaryInsurance.find(params[:primary_insurance_id])
    @count = @primary_insurance.loss_payee
    @loss_payee = LossPayee.new
  end

  def create
    @primary_insurance = PrimaryInsurance.find(params[:primary_insurance_id])
    @loss_payee = LossPayee.new(loss_payee_params)
    @loss_payee.primary_insurance = @primary_insurance
    total = @primary_insurance.loss_payee
    loss_payees = LossPayee.where("primary_insurance_id = '#{@primary_insurance.id}'").count
    if @loss_payee.save
      if ( loss_payees != total - 1)
        redirect_to new_primary_insurance_loss_payee_path(@primary_insurance)
      else
        redirect_to @primary_insurance.insure_trad_supp
      end
    else
      render :new
    end
  end

  private

  def loss_payee_params
    params.require(:loss_payee).permit(:name, :address, :zipcode, :city, :country)
  end

end
