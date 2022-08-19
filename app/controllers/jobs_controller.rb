class JobsController < ApplicationController
    before_action :logged_in_user, only: [:show]
    def new
    end
    def show
        @job = Job.find(params[:id])
    end

    def index
        @jobs = Job.page params[:page]
    end

private

    def logged_in_user
        unless user_signed_in?
          flash[:danger] = "Please log in."
          redirect_to new_user_session_path
        end
    end
end
