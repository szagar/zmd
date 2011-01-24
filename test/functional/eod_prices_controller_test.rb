require 'test_helper'

class EodPricesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => EodPrice.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    EodPrice.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    EodPrice.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to eod_price_url(assigns(:eod_price))
  end
  
  def test_edit
    get :edit, :id => EodPrice.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    EodPrice.any_instance.stubs(:valid?).returns(false)
    put :update, :id => EodPrice.first
    assert_template 'edit'
  end

  def test_update_valid
    EodPrice.any_instance.stubs(:valid?).returns(true)
    put :update, :id => EodPrice.first
    assert_redirected_to eod_price_url(assigns(:eod_price))
  end
  
  def test_destroy
    eod_price = EodPrice.first
    delete :destroy, :id => eod_price
    assert_redirected_to eod_prices_url
    assert !EodPrice.exists?(eod_price.id)
  end
end
