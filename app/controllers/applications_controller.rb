class ApplicationsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: %i[edit update destroy promote go_back_promote reject]
  before_action :set_application, only: %i[ show edit update destroy promote go_back_promote reject]
  
  def create
    @job = Job.find(params[:job_id])
    @new_app = Application.new(job: @job, user: current_user, stage: @job.stages.first)
    if @new_app.save
      UserMailer.send_application(current_user, @new_app).deliver_now
      flash[:info] = "Please check your email."
    end
    redirect_to current_user
  end

  def show
    @all_comments = Comment.get_all_comments_job_user(@application.job_id, @application.user_id)
  end

  def destroy
    job = @application.job
    current_user.unapply(job)
    redirect_to @application.user
  end
     
  def promote
    @application.promote
    UserMailer.send_challenge(@application.user, @application).deliver_now
    redirect_to kanban_path(job_id: @application.job.id)
  end

  def go_back_promote
    @application.go_back_promote
    redirect_to kanban_path(job_id: @application.job.id)
  end

  def reject
    @application.deactivate
    UserMailer.reject_candidate(@application.user, @application.job).deliver_now
    redirect_to kanban_path(job_id: @application.job.id)
  end
  
  private

    def set_application
      @application = Application.find(params[:id])
    end
end
