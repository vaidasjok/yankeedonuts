require 'test_helper'

class DonutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donut = donuts(:one)
  end

  test "should get index" do
    get donuts_url
    assert_response :success
  end

  test "should get new" do
    get new_donut_url
    assert_response :success
  end

  test "should create donut" do
    assert_difference('Donut.count') do
      post donuts_url, params: { donut: { description: @donut.description, title: @donut.title } }
    end

    assert_redirected_to donut_url(Donut.last)
  end

  test "should show donut" do
    get donut_url(@donut)
    assert_response :success
  end

  test "should get edit" do
    get edit_donut_url(@donut)
    assert_response :success
  end

  test "should update donut" do
    patch donut_url(@donut), params: { donut: { description: @donut.description, title: @donut.title } }
    assert_redirected_to donut_url(@donut)
  end

  test "should destroy donut" do
    assert_difference('Donut.count', -1) do
      delete donut_url(@donut)
    end

    assert_redirected_to donuts_url
  end
end
