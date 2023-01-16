class UsersController < ApplicationController
before_action :get_user, only: [:show]

def index
 if params[:query].present?
    @users = User.where("username LIKE ?", "%#{params[:query]}%")
 else
    @users = []
 end
 if turbo_frame_request?
    render partial: "layouts/search_result", locals: {users: @users}
 end
end

def show
end

private 

def get_user
    @user = User.find(params[:id])
end
end