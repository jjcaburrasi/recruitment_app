require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers # Rails >= 5

  def setup
    @other_user = users(:silvana)
    
  end

  test "should not allow the admin attribute to be edited via the web" do
    sign_in @other_user
    assert_not @other_user.admin?
    patch user_path(@other_user), params: { user: { password: "password",
                                            admin: 1 } }
    assert_not @other_user.reload.admin?
  end
end
