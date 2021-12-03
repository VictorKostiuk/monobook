class User < ApplicationRecord
        before_save :email

         validates :phone_number, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:phone_number]


        has_one_attached :avatar

        validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
              file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

         def email_required?
          false
         end

         def email_changed?
          false
         end

         private

           def email
            self.email = Faker::Internet.unique.email
           end
end
