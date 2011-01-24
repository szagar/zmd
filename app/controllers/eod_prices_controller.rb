class EodPricesController < ApplicationController
  def index
    @eod_prices = EodPrice.all
  end
  
  def show
    @eod_price = EodPrice.find(params[:id])
  end
  
  def new
    @eod_price = EodPrice.new
  end
  
  def create
    @eod_price = EodPrice.new(params[:eod_price])
    if @eod_price.save
      flash[:notice] = "Successfully created eod price."
      redirect_to @eod_price
    else
      render :action => 'new'
    end
  end
  
  def edit
    @eod_price = EodPrice.find(params[:id])
  end
  
  def update
    @eod_price = EodPrice.find(params[:id])
    if @eod_price.update_attributes(params[:eod_price])
      flash[:notice] = "Successfully updated eod price."
      redirect_to @eod_price
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @eod_price = EodPrice.find(params[:id])
    @eod_price.destroy
    flash[:notice] = "Successfully destroyed eod price."
    redirect_to eod_prices_url
  end
end
