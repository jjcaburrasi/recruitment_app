class ApplicationsController < ApplicationController
  before_action :logged_in_user
  
  def create
    job = Job.find(params[:job_id])
    current_user.apply(job)
    redirect_to current_user
  end

  def destroy
    job = Application.find(params[:id]).users
    current_user.unapply(job)
    redirect_to user
  end
     
end
