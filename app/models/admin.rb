class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
end
