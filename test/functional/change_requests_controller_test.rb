require 'test_helper'

class ChangeRequestsControllerTest < ActionController::TestCase
  setup do
    @change_request = change_requests(:one)
  end

  test "should get show" do
    get :show
    assert_response :success
    assert_not_nil assigns(:change_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create change_request" do
    assert_difference('ChangeRequest.count') do
      post :create, change_request: { \requester_id: @change_request.\requester_id, assigned_to: @change_request.assigned_to, change_type: @change_request.change_type, description: @change_request.description, due_date: @change_request.due_date, request_date: @change_request.request_date, status: @change_request.status, summary: @change_request.summary }
    end

    assert_redirected_to change_request_path(assigns(:change_request))
  end

  test "should show change_request" do
    get :show, id: @change_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @change_request
    assert_response :success
  end

  test "should update change_request" do
    put :update, id: @change_request, change_request: { \requester_id: @change_request.\requester_id, assigned_to: @change_request.assigned_to, change_type: @change_request.change_type, description: @change_request.description, due_date: @change_request.due_date, request_date: @change_request.request_date, status: @change_request.status, summary: @change_request.summary }
    assert_redirected_to change_request_path(assigns(:change_request))
  end

  test "should destroy change_request" do
    assert_difference('ChangeRequest.count', -1) do
      delete :destroy, id: @change_request
    end

    assert_redirected_to change_requests_path
  end
end
