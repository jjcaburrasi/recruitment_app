require "test_helper"

class JobTest < ActiveSupport::TestCase
  
  def setup
    @job = Job.new(title: "Example Job", description: "Description of the job")
  end
   
  test "should be valid" do
    assert @job.valid?
  end
  
  test "title should be present" do
    @job.title = nil
    assert_not @job.valid?
  end

  test "description should be present" do
    @job.description = " "
    assert_not @job.valid?
  end

  test "associated stages should be destroyed" do #test for stages
    @job.save
    @job.stages.create!(name: "StageX")
    assert_difference 'Stage.count', -1 do
      @job.destroy
    end
  end
end
