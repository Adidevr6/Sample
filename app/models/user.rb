class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :current_password

  validates :first_name, :last_name, :date_of_birth, presence: true
  validates :date_of_birth, timeliness: {before: lambda { Date.current }, type: :date}

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}".capitalize
  end
end
