require "test_helper"

class StagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stage = stages(:stage)
    @user = users(:jose)
  end

  test "should get index" do
    sign_in @user
    get stages_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_stage_url
    assert_response :success
  end

  test "should create stage" do
    sign_in @user
    assert_difference('Stage.count') do
      post stages_url, params: { stage: { job_id: @stage.job_id, name: @stage.name } }
    end
    assert_redirected_to job_url(@stage.job_id)
  end

  test "should show stage" do
    sign_in @user
    get stage_url(@stage)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_stage_url(@stage)
    assert_response :success
  end

  test "should update stage" do
    sign_in @user
    patch stage_url(@stage), params: { stage: { job_id: @stage.job_id, name: @stage.name } }
    assert_redirected_to stage_url(@stage)
  end

  test "should destroy stage" do
    sign_in @user
    assert_difference('Stage.count', -1) do
      delete stage_url(@stage)
    end

    assert_redirected_to stages_url
  end
end
