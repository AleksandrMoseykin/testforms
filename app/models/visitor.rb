class Visitor < ApplicationRecord
  validates :photo, file_size: { less_than: 1.megabytes }
  mount_uploader :photo, ImageUploader
end
