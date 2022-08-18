class JobsController < ApplicationController
    def new
    end
    def show
        @job = Job.find(params[:id])
    end

    def index
        @jobs = Job.page params[:page]
    end
end
