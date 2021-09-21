class Job < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["Full-time", "Part-time", "Contract", "Freelance"]
end
