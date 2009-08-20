require 'test_helper'

class ArgumentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:arguments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_argument
    assert_difference('Argument.count') do
      post :create, :argument => { }
    end

    assert_redirected_to argument_path(assigns(:argument))
  end

  def test_should_show_argument
    get :show, :id => arguments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => arguments(:one).id
    assert_response :success
  end

  def test_should_update_argument
    put :update, :id => arguments(:one).id, :argument => { }
    assert_redirected_to argument_path(assigns(:argument))
  end

  def test_should_destroy_argument
    assert_difference('Argument.count', -1) do
      delete :destroy, :id => arguments(:one).id
    end

    assert_redirected_to arguments_path
  end
end
