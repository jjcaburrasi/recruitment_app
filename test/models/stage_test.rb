require "test_helper"

class StageTest < ActiveSupport::TestCase

  def setup
    @job = jobs(:job1)
    @stage = @job.stages.build(name: "Selection")
  end
    
  test "should be valid" do
    assert @stage.valid?
  end
  
  test "job id should be present" do
    @stage.job_id = nil
    assert_not @stage.valid?
  end

  test "name should be present" do
    @stage.name = " "
    assert_not @stage.valid?
  end

end
