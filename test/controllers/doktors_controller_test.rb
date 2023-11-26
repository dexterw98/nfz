require 'test_helper'

class DoktorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doktors_index_url
    assert_response :success
  end

end
