class CustomersController < ApplicationController

	def index
		@customers = Customer.all
	end

  def new 
    @customer = Customer.new
  end

	def create
		@customer = Customer.new(allowed_params)
		if @customer.save
			redirect_to customers_path
		end
	end
 
  def edit
    @customer = Customer.find_by_id(params[:id])
  end

  def update
    u = Customer.find_by_id(params[:id])
    u.update_attributes(allowed_params);
    redirect_to customers_path
  end

	def destroy  
    customer = Customer.find_by_id(params[:id])
    customer.destroy
    redirect_to customers_path
	end

  private

	def allowed_params
		params.require(:customer).permit(:firstname, :lastname, :contact, :address)
  end
end
