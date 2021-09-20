class Job < ApplicationRecord
  belongs_to :user
  has_many :applies, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["Full-time", "Part-time", "Contract", "Freelance"]
end
