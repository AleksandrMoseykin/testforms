class Contact < ApplicationRecord
  paginates_per  20
  validates :idvisitor, presence: true, numericality: true,
            uniqueness: {scope: :idcreator}
  validates :idcreator, presence: true, numericality: true, if: :user_validation?
  validates :codecreator, presence: true, if: :id_validation?

  private
  def user_validation?
    if User.find_by(id: self.idcreator)
      if User.find_by(id: self.idcreator).encrypted_password != self.codecreator
        errors.add(:idcreator, "Ошибка")
      end
    else
      errors.add(:idcreator, "Ошибка")
    end

    if User.find_by(encrypted_password: self.codecreator)
      if User.find_by(encrypted_password: self.codecreator).id != self.idcreator
        errors.add(:idcreator, "Ошибка")
      end
    else
      errors.add(:idcreator, "Ошибка")
    end
  end

  def id_validation?
    unless Username.find_by(id: self.idvisitor)
      errors.add(:idvisitor, "Ошибка")
    end
  end
end
