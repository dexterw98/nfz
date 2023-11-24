require 'test_helper'

class PacjenciControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pacjenci_index_url
    assert_response :success
  end

end
