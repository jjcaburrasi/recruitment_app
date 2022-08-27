class UsersController < ApplicationController

    # before_action :correct_user, only: [:edit, :update]
    # before_action :admin_user, only: [:show, :edit, :update, :destroy]
    
    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.page(params[:page])
    end

    def update
    end

    # private
    #     #Confirms an admin user.
    #     def admin_user
    #         redirect_to(root_url) unless current_user.admin?
    #     end
end
