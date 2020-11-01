class Creator < ApplicationRecord
  validates :photocreator, file_size: { less_than: 1.megabytes }
  mount_uploader :photocreator, ImageUploader
  validates :namecreator, length: { in: 2..25 }, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true
  validates :surnamecreator, length: { in: 3..25 }, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true
  validates :telephonecreator, length: { in: 3..25 }, format: { with: /\A[0-9\s+-]+\z/}, presence: true
  validates :companycreator, length: { in: 3..300 }, allow_blank: true
  validates :promocodecreator, length: { in: 3..300 }, allow_blank: true

  before_validation :user_validtion

  private
    def user_validtion
        if self.codevisitor != User.find_by(id: self.idregvis).encrypted_password
          valid = User.find_by(encrypted_password: self.codecreator).id
          valid.save!
        end
    end
end
