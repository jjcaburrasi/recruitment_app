class ApplicationsController < ApplicationController
  
  def new
  end

  def create
    @applications = current_user.job.build(micropost_params)
    if @applications.save
      flash[:success] = "You have applied!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

end
