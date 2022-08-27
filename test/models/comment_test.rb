require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup

    @comm = Comment.new(user_id: users(:jose).id,
                        job_id: jobs(:job1).id, content: "contenido")
  end

  test "should be valid" do
    assert @comm.valid?
  end
  
  test "user_id should be present" do
    @comm.user_id = nil
    assert_not @comm.valid?
  end

  test "job_id should be present" do
    @comm.job_id= nil
    assert_not @comm.valid?
  end

  test "comment should be present" do
    @comm.content = ""
    assert_not @comm.valid?
  end
end
