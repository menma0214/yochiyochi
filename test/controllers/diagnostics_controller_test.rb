require "test_helper"

class DiagnosticsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diagnostics_new_url
    assert_response :success
  end

  test "should get create" do
    get diagnostics_create_url
    assert_response :success
  end
end
