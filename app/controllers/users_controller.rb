class UsersController < ApplicationController
  def index
    if params[:role]=="All"
      @users = User.all
    else
      @users = User.where(role: params[:role])
    end
  end
  def show
    @users = User.where(role: params[:role])
  end
  
end
