require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
#    post :create, author: @author.attributes

#    assert_redirected_to author_path(assigns(:author))
  end

  test "should show author" do
#    get :show, id: @author
#    assert_response :success
  end

  test "should get edit" do
#    get :edit, id: @author
#    assert_response :success
  end

  test "should update author" do
#    put :update, id: @author, author: @author.attributes
#    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
#    delete :destroy, id: @author

#    assert_redirected_to authors_path
  end
end
