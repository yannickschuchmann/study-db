require 'test_helper'

class CasesControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get cases_test_url
    assert_response :success
  end

  test "should get answer" do
    get cases_answer_url
    assert_response :success
  end

end
