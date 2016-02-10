require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get set" do
    get settings_set_url
    assert_response :success
  end

end
