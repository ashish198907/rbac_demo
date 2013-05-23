class RolesUsersController < ApplicationController
  before_filter :require_user

  def roles_users_index;  end

  def update_roles
    @role = Role.find(params[:role_id])
    @user = User.find(params[:user_id])
    @flag = (params[:associate]== "true" ? true : false)
    if @flag
      @user.roles << @role
    else
      @user.roles.delete(@role)
    end
    render :json => true
  end
end
