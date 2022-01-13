class SessionsController < ApplicationController
    
    def create
        user = User.find_by username: params[:username]
        if user
            session[:user_id] ||= user.id
            render json: user
        else
            render json: { error: "Username not found" }, status: :not_found
        end
    end
    
    def destroy
        session.delete :user_id
        render :no_head, status: 204
    end
end
