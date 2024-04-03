class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to show_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :introduction)
  end

end
