class UsersController < ApplicationController

    before_action :logged_in_user 
    before_action :admin_user, only: :index
    
    def show
        @user = User.find(params[:id])
    
        if current_user != @user && !current_user.admin?
            redirect_to root_url
        end
    end

    def index
        @users = User.page(params[:page])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            render 'edit'
        end
          
    end

    

    private
        #Confirms an admin user.
        def admin_user
            redirect_to(root_url) unless current_user.admin?
        end

    def user_params
        params.require(:user).permit(:name, :email, :description)
      end
end
