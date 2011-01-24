class SplitsController < ApplicationController
  def index
    @splits = Split.all
  end
  
  def show
    @split = Split.find(params[:id])
  end
  
  def new
    @split = Split.new
  end
  
  def create
    @split = Split.new(params[:split])
    if @split.save
      flash[:notice] = "Successfully created split."
      redirect_to @split
    else
      render :action => 'new'
    end
  end
  
  def edit
    @split = Split.find(params[:id])
  end
  
  def update
    @split = Split.find(params[:id])
    if @split.update_attributes(params[:split])
      flash[:notice] = "Successfully updated split."
      redirect_to @split
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @split = Split.find(params[:id])
    @split.destroy
    flash[:notice] = "Successfully destroyed split."
    redirect_to splits_url
  end
end
