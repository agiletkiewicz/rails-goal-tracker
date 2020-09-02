class SessionsController < ApplicationController

    def destroy
        session.delete :user_id

        redirect_to '/'
    end

    def new
        @user = User.new
        set_meta_tags image_src: "https://images.pexels.com/photos/733857/pexels-photo-733857.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        render layout: "welcome"
    end

    def facebook_login
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.username = auth['info']['email']
            u.uid = auth['uid']
            u.password = SecureRandom.urlsafe_base64
        end
        session[:user_id] = @user.id
        redirect_to '/'
    end

    def create 
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id

            redirect_to '/'
        else
            flash[:alert] = "Could not authenticate your account"
            @user = User.new
            render :new
        end
        
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end