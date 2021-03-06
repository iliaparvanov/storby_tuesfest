class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: true
  has_one_attached :profile_pic

  # before_create :set_default_role

  has_many :games

  private
  # def set_default_role
  #   self.role ||= Role.find_by_name('user')
  # end
end
