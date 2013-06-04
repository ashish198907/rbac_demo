class HomeController < ApplicationController
  before_filter :require_user

  def index
  end

  def search_user_role_access
    @users = User.all
    @results = []
    @users.each do |u|
      @results << [u.login,u.roles.map(&:name),u.roles.map(&:accesses).flatten.map(&:name).uniq]
    end
  end

  def submit_search
    @users = params[:user_id].present? ? User.all(:conditions => {:id => params[:user_id]}) : User.all
    @roles = params[:role_id].present? ? Role.all(:conditions => {:id => params[:role_id]}) : Role.all
    @accesses = params[:access_id].present? ? Access.all(:conditions => {:id => params[:access_id]}) : Access.all
    @results = []
    @users.reject!{|u| !u.roles.map(&:id).include?(@roles.first.id)} if @roles.size == 1
    @users.reject!{|u| !u.roles.map(&:accesses).flatten.map(&:id).include?(@accesses.first.id)} if @accesses.size == 1
    @users.each do |u|
      user_roles = u.roles.map(&:name)
      user_access = u.roles.map(&:accesses).flatten.map(&:name).uniq
      @results << [u.login,user_roles,user_access]
    end
  end
end
