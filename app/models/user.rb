class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :employments, dependent: :destroy
  validates :name,     presence: true, length: {maximum: 20}
  validates :email,    presence: true, length: {maximum: 255},
                       uniqueness: true
                      #  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
