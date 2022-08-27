require "test_helper"

class ApplicationTest < ActiveSupport::TestCase

  def setup
    @user = users(:jose)
    @job  = jobs(:job1)
    @app  = Application.new(user: @user , job: @job, stage_id: 3)
  end

  test "should be valid" do
    assert @app.valid?
  end
  
  test "user_id should be present" do
    @app.user_id = nil
    assert_not @app.valid?
  end

  test "job_id should be present" do
    @app.job_id= nil
    assert_not @app.valid?
  end

  test "stage_id should be present" do
    @app.stage_id = nil
    assert_not @app.valid?
  end

end
