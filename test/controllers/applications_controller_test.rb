require "test_helper"

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5
   setup do
    @application = applications(:application)
    @user = users(:jose)
    @job = jobs(:job1)
  end
  
  # test "should get show" do
  #   sign_in @user
  #   get application_path(@application)
  #   assert_response :success
  # end
end
