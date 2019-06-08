require 'test_helper'

class KezelesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kezele = kezeles(:one)
  end

  test "should get index" do
    get kezeles_url
    assert_response :success
  end

  test "should get new" do
    get new_kezele_url
    assert_response :success
  end

  test "should create kezele" do
    assert_difference('Kezele.count') do
      post kezeles_url, params: { kezele: {  } }
    end

    assert_redirected_to kezele_url(Kezele.last)
  end

  test "should show kezele" do
    get kezele_url(@kezele)
    assert_response :success
  end

  test "should get edit" do
    get edit_kezele_url(@kezele)
    assert_response :success
  end

  test "should update kezele" do
    patch kezele_url(@kezele), params: { kezele: {  } }
    assert_redirected_to kezele_url(@kezele)
  end

  test "should destroy kezele" do
    assert_difference('Kezele.count', -1) do
      delete kezele_url(@kezele)
    end

    assert_redirected_to kezeles_url
  end
end
