class User < ApplicationRecord
  has_many :entries

  # validate :email_domain

  # def email_domain
  #   domain = email.split("@").last
  #   if !email.blank?
  #     errors.add(:email, "Invalid Domain") if domain != "mygreenplanet.com"
  #   end
  # end

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
end
