require "test_helper"

class PlaygroundEquipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playground_equipments_index_url
    assert_response :success
  end

  test "should get show" do
    get playground_equipments_show_url
    assert_response :success
  end
end
