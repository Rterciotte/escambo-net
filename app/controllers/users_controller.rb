class UsersController < ApplicationController
  def search
    @users = User.where('full_name LIKE UPPER(?)', "%#{params[:q]}%")
    render :index
  end

  def index
    @users = User.all
  end
end
