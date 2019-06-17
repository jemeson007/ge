class CheesesController < ApplicationController
	before_action :authenticate_person!, except: [:index, :show]
	
  def index
  	@cheeses  = Cheese.all
  end

  def new
  	@cheese = current_person.cheeses.build
  end

  def create
  	@cheese = current_person.cheeses.build(cheese_params)

  	if @cheese.save
      if @cheese.process
        redirect_to cheese_path, notice: "You have been successfully charged." and return
   	  end
  	end
  	render 'new'
  end

private

  def cheese_params
  	params.require(:cheese).permit(:first_name, :last_name, :credit_card_number, :expiration_month, :expiration_year, :card_security_code, :amount)
  	
  end
end
