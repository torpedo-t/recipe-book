class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.find_or_create_by(email: auth['info']['email']) do |u|
                u.password = SecureRandom.hex(12)
            end
            if @user
                session[:user_id] = @user.id
                # byebug
                redirect_to user_path(@user)
            else
                redirect_to root_path
            end
        else
            @user = User.find_by(email: params[:user][:email])
            # byebug
            if @user && @user.authenticate(params[:user][:password])
                # byebug
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render "sessions/new"
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
end