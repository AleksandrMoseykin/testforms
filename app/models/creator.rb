class Creator < ApplicationRecord
  validates :photocreator, file_size: { less_than: 1.megabytes }
  mount_uploader :photocreator, ImageUploader
end
