require 'test_helper'

class AssetTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => AssetType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    AssetType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    AssetType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to asset_type_url(assigns(:asset_type))
  end
  
  def test_edit
    get :edit, :id => AssetType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    AssetType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AssetType.first
    assert_template 'edit'
  end

  def test_update_valid
    AssetType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AssetType.first
    assert_redirected_to asset_type_url(assigns(:asset_type))
  end
  
  def test_destroy
    asset_type = AssetType.first
    delete :destroy, :id => asset_type
    assert_redirected_to asset_types_url
    assert !AssetType.exists?(asset_type.id)
  end
end
