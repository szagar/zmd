class TechnicalsController < ApplicationController
  def index
    @technicals = Technicals.all
  end
  
  def show
    @technicals = Technicals.find(params[:id])
  end
  
  def new
    @technicals = Technicals.new
  end
  
  def create
    @technicals = Technicals.new(params[:technicals])
    if @technicals.save
      flash[:notice] = "Successfully created technicals."
      redirect_to @technicals
    else
      render :action => 'new'
    end
  end
  
  def edit
    @technicals = Technicals.find(params[:id])
  end
  
  def update
    @technicals = Technicals.find(params[:id])
    if @technicals.update_attributes(params[:technicals])
      flash[:notice] = "Successfully updated technicals."
      redirect_to @technicals
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @technicals = Technicals.find(params[:id])
    @technicals.destroy
    flash[:notice] = "Successfully destroyed technicals."
    redirect_to technicals_url
  end
end
