class Users::YardsalesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_yardsale, :only => [:edit, :update, :destroy]
  
  def index
    @yardsales = current_user.yardsales
  end
  
  def new
    @yardsale = Yardsale.new
  end
  
  def create
    @yardsale = current_user.yardsales.new(yardsale_params)
    if @yardsale.save
      redirect_to users_yardsales_path, :notice => 'Yardsale Created'
    else
      render "new"
    end
  end
  
  def edit
    
  end
  
  def update
    if @yardsale.update(yardsale_params)
      redirect_to users_yardsales_path, :notice => 'Yardsale Updated'
    else
      render "edit"
    end
  end
  
  def destroy
    @yardsale.destroy
    redirect_to users_yardsales_path, :notice => "Yardsale Deleted"
  end
  
  private
  
  def get_yardsale
    @yardsale = current_user.yardsales.find_by_id(params[:id])
  end
  
  def yardsale_params
    params.required(:yardsale).permit(:name, :description, :caption, :start_date, :end_date, :address1, :address2, :city, :state, :zip)
  end
end