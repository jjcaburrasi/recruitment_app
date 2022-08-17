class JobsController < ApplicationController
    def new
    end
    def show
        @job = Job.find(params[:id])
    end

    def index
        @jobs = Job.paginate(page: params[:page])
    end
end
