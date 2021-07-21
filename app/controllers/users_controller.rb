class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        # byebug
        if @user.save
            # byebug
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render "users/new"
        end
    end

    def show
        @user = User.find_by(id: session[:user_id])
        # byebug
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end