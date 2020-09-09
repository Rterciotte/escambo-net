class User < ApplicationRecord
  attr_accessor :full_name, :social_name, :birth_date, :occupation, :department, :company_name, :email, :password 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
