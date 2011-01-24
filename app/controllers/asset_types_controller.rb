class AssetTypesController < ApplicationController
  def index
    @asset_types = AssetType.all
  end
  
  def show
    @asset_type = AssetType.find(params[:id])
  end
  
  def new
    @asset_type = AssetType.new
  end
  
  def create
    @asset_type = AssetType.new(params[:asset_type])
    if @asset_type.save
      flash[:notice] = "Successfully created asset type."
      redirect_to @asset_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @asset_type = AssetType.find(params[:id])
  end
  
  def update
    @asset_type = AssetType.find(params[:id])
    if @asset_type.update_attributes(params[:asset_type])
      flash[:notice] = "Successfully updated asset type."
      redirect_to @asset_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @asset_type = AssetType.find(params[:id])
    @asset_type.destroy
    flash[:notice] = "Successfully destroyed asset type."
    redirect_to asset_types_url
  end
end
