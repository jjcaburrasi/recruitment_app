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

end
