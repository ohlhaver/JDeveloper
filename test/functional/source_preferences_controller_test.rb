require 'test_helper'

class SourcePreferencesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_preferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_preference" do
    assert_difference('SourcePreference.count') do
      post :create, :source_preference => { }
    end

    assert_redirected_to source_preference_path(assigns(:source_preference))
  end

  test "should show source_preference" do
    get :show, :id => source_preferences(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => source_preferences(:one).to_param
    assert_response :success
  end

  test "should update source_preference" do
    put :update, :id => source_preferences(:one).to_param, :source_preference => { }
    assert_redirected_to source_preference_path(assigns(:source_preference))
  end

  test "should destroy source_preference" do
    assert_difference('SourcePreference.count', -1) do
      delete :destroy, :id => source_preferences(:one).to_param
    end

    assert_redirected_to source_preferences_path
  end
end
