class Contact < ApplicationRecord
  validates :idvisitor, presence: true, numericality: true, uniqueness: {scope: :idcreator}
  validates :idcreator, presence: true, numericality: true
  validates :codecreator, presence: true

  before_validation :user_validation
  before_validation :user_id_validation

  private
    def user_validation
        if self.codecreator != User.find_by(id: self.idcreator).encrypted_password
          valid = User.find_by(encrypted_password: self.codecreator).id
          valid.save!
        end
    end
    def user_id_validation
        if User.find_by(id: self.idvisitor).encrypted_password == nil
          valid = User.find_by(encrypted_password: self.codecreator).id
          valid.save!
        end
    end
end
