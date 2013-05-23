class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :login, :email, :password, :password_confirmation
  has_and_belongs_to_many :roles

  def has_access?(access_id)
    self.roles.map{|r| r.accesses}.flatten.map(&:id).uniq.include?(access_id)
  end

end
