class Creator < ApplicationRecord
  validates :photocreator, file_size: { less_than: 1.megabytes }
  mount_uploader :photocreator, ImageUploader
  validates :namecreator, length: { in: 2..25 }, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true, if: :user_validation?
  validates :surnamecreator, length: { in: 3..25 }, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true
  validates :telephonecreator, length: { in: 3..25 }, format: { with: /\A[0-9\s+-]+\z/}, presence: true
  validates :companycreator, length: { in: 3..300 }, allow_blank: true
  validates :promocodecreator, length: { in: 3..300 }, allow_blank: true

  private
  def user_validation?
    if User.find_by(id: self.idreg)
      if User.find_by(id: self.idreg).encrypted_password != self.codecreator
        errors.add(:idreg, "Ошибка")
      end
    else
      errors.add(:idcreator, "Ошибка")
    end

    if User.find_by(encrypted_password: self.codecreator)
      if User.find_by(encrypted_password: self.codecreator).id != self.idreg
        errors.add(:idreg, "Ошибка")
      end
    else
      errors.add(:idreg, "Ошибка")
    end
  end
end
