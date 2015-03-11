class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  default_scope -> { order('created_at DESC') }
  validates_uniqueness_of :username
  validates_confirmation_of :password, length: { in: 6..20 }
  validates_presence_of :username, :role, :login_approval, :first_name, :last_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
end
