class UsersController < ApplicationController
  before_action :logged_in
  before_action :checkAuth

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to controller: "users", action: "index"
    else
      redirect_to controller: "users", action: "index"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to controller: "users", action: "index"
    else
      redirect_to controller: "users", action: "index"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to controller: "users", action: "index"
    else
      redirect_to controller: "users", action: "index"
    end
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :usertype)
    end

    def checkAuth
      is_authorized("Admin")
    end
end
