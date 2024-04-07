class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_admin_show_path(@customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :email, :is_deleted)
  end

end
