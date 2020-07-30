class Question < ApplicationRecord
  belongs_to :topic
  validates :imgquestion, file_size: { less_than: 1.megabytes }
  mount_uploader :imgquestion, PhotoUploader
end
