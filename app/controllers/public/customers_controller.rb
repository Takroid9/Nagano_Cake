class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    if @customer != current_customer
      redirect_to customer_path(current_customer)
    end
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer)
    else
      render :edit
    end
  end


  def unsubscribe
  end

  private
  def customer_params
    params.require(:customer).permit(:name)
  end
end
