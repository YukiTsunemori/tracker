require "test_helper"

class ReplyMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reply_messages_create_url
    assert_response :success
  end
end
