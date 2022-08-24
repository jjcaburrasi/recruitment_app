require "test_helper"

class StagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @stage = stages(:stage)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Stage.count' do
      post stages_path, params: { stage: { name: "StageX" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Stage.count' do
      delete stages_path(@stage)
    end
    assert_redirected_to login_url
  end
end
