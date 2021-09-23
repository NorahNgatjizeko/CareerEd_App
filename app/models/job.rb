class Job < ApplicationRecord
  belongs_to :user
  has_many :employments, dependent: :destroy
  has_many :employments_users, through: :employments, source: :user

  validates :title,          presence: true, length: {maximum: 20}
  validates :description,    presence: true, length: {maximum: 255}

  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["Full-time", "Part-time", "Contract", "Freelance"]
end
