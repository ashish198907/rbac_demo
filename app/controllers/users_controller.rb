class UsersController < ApplicationController
  before_filter :require_user, :except => [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice]= "Account created successfully!"
      redirect_to home_index_url
    else
      render :controller => 'user_sessions', :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your profile updated successfully."
      redirect_to home_index_url
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted successfully."
    redirect_to users_url
  end
end
