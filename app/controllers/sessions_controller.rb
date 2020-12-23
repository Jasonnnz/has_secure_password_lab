class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by(name: params[:user][:name])

        if user && user.authenticate(params[:user][:password]) 
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Password or Username incorrect"
            redirect_to new_session_path 
        end 
        # user = user.try(:authenticate, params[:user][:password])
    
        # return redirect_to(controller: 'sessions', action: 'new') unless user
    
        # session[:user_id] = user.id
    
        # @user = user
    
        # redirect_to user_path(user)
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

end
