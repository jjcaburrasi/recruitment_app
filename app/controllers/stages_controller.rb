class StagesController < ApplicationController
    before_action :admin_user, only: [:create, :destroy]

    def create
        @job = Job.find(params[:job_id])
        @stage = job.stages.build(stage_params)
        if @stage.save
            flash[:success] = "Stage added!"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    def destroy
    end

    private
        def stage_params
            params.require(:stage).permit(:name)
        end
end
