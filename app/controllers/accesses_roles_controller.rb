class AccessesRolesController < ApplicationController
  before_filter :require_user

  def accesses_roles_index;  end

  def update_accesses
    @role = Role.find(params[:role_id])
    @access = Access.find(params[:access_id])
    @flag = (params[:associate]== "true" ? true : false)
    if @flag
      @role.accesses << @access
    else
      @role.accesses.delete(@access)
    end
    render :json => true
  end

end
