class FundamentalsController < ApplicationController
  def index
    @fundamentals = Fundamentals.all
  end
  
  def show
    @fundamentals = Fundamentals.find(params[:id])
  end
  
  def new
    @fundamentals = Fundamentals.new
  end
  
  def create
    @fundamentals = Fundamentals.new(params[:fundamentals])
    if @fundamentals.save
      flash[:notice] = "Successfully created fundamentals."
      redirect_to @fundamentals
    else
      render :action => 'new'
    end
  end
  
  def edit
    @fundamentals = Fundamentals.find(params[:id])
  end
  
  def update
    @fundamentals = Fundamentals.find(params[:id])
    if @fundamentals.update_attributes(params[:fundamentals])
      flash[:notice] = "Successfully updated fundamentals."
      redirect_to @fundamentals
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @fundamentals = Fundamentals.find(params[:id])
    @fundamentals.destroy
    flash[:notice] = "Successfully destroyed fundamentals."
    redirect_to fundamentals_url
  end
end
