class User < ApplicationRecord
         validates :phone_number, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:phone_number]



         def email_required?
          false
         end

         def email_changed?
          false
         end
end
