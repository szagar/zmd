require 'test_helper'

class SplitsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Split.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Split.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Split.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to split_url(assigns(:split))
  end
  
  def test_edit
    get :edit, :id => Split.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Split.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Split.first
    assert_template 'edit'
  end

  def test_update_valid
    Split.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Split.first
    assert_redirected_to split_url(assigns(:split))
  end
  
  def test_destroy
    split = Split.first
    delete :destroy, :id => split
    assert_redirected_to splits_url
    assert !Split.exists?(split.id)
  end
end
