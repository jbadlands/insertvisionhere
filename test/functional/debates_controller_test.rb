require 'test_helper'

class DebatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:debates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_debate
    assert_difference('Debate.count') do
      post :create, :debate => { }
    end

    assert_redirected_to debate_path(assigns(:debate))
  end

  def test_should_show_debate
    get :show, :id => debates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => debates(:one).id
    assert_response :success
  end

  def test_should_update_debate
    put :update, :id => debates(:one).id, :debate => { }
    assert_redirected_to debate_path(assigns(:debate))
  end

  def test_should_destroy_debate
    assert_difference('Debate.count', -1) do
      delete :destroy, :id => debates(:one).id
    end

    assert_redirected_to debates_path
  end
end
