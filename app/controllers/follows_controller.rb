class FollowsController < ApplicationController
    before_action :set_user, only: [:follow, :unfollow, :cancel_request]
    before_action :get_follow_request, only: [:accept_follow, :decline_follow]
    def follow
       current_user.follow(@user)
       redirect_back(fallback_location: root_path)
    end
    
    def unfollow
       current_user.unfollow(@user)
       redirect_back(fallback_location: root_path)
    end
    
    def cancel_request
        current_user.cancel_request(@user)
        redirect_back(fallback_location: root_path)
    end

    def accept_follow
        @follow.accept
        redirect_back(fallback_location: root_path)

    end

    def decline_follow
        @follow.destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def set_user
        @user = User.find(params[:user_id])
    end

    def get_follow_request
        @follow = Follow.find(params[:follow_id])
    end
end