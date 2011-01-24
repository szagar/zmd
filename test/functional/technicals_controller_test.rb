require 'test_helper'

class TechnicalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Technicals.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Technicals.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Technicals.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to technicals_url(assigns(:technicals))
  end
  
  def test_edit
    get :edit, :id => Technicals.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Technicals.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Technicals.first
    assert_template 'edit'
  end

  def test_update_valid
    Technicals.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Technicals.first
    assert_redirected_to technicals_url(assigns(:technicals))
  end
  
  def test_destroy
    technicals = Technicals.first
    delete :destroy, :id => technicals
    assert_redirected_to technicals_url
    assert !Technicals.exists?(technicals.id)
  end
end
