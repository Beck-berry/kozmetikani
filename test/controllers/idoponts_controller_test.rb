require 'test_helper'

class IdopontsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idopont = idoponts(:one)
  end

  test "should get index" do
    get idoponts_url
    assert_response :success
  end

  test "should get new" do
    get new_idopont_url
    assert_response :success
  end

  test "should create idopont" do
    assert_difference('Idopont.count') do
      post idoponts_url, params: { idopont: {  } }
    end

    assert_redirected_to idopont_url(Idopont.last)
  end

  test "should show idopont" do
    get idopont_url(@idopont)
    assert_response :success
  end

  test "should get edit" do
    get edit_idopont_url(@idopont)
    assert_response :success
  end

  test "should update idopont" do
    patch idopont_url(@idopont), params: { idopont: {  } }
    assert_redirected_to idopont_url(@idopont)
  end

  test "should destroy idopont" do
    assert_difference('Idopont.count', -1) do
      delete idopont_url(@idopont)
    end

    assert_redirected_to idoponts_url
  end
end
