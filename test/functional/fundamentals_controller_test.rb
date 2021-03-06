require 'test_helper'

class FundamentalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Fundamentals.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Fundamentals.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Fundamentals.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to fundamentals_url(assigns(:fundamentals))
  end
  
  def test_edit
    get :edit, :id => Fundamentals.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Fundamentals.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Fundamentals.first
    assert_template 'edit'
  end

  def test_update_valid
    Fundamentals.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Fundamentals.first
    assert_redirected_to fundamentals_url(assigns(:fundamentals))
  end
  
  def test_destroy
    fundamentals = Fundamentals.first
    delete :destroy, :id => fundamentals
    assert_redirected_to fundamentals_url
    assert !Fundamentals.exists?(fundamentals.id)
  end
end
