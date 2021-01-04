class Topic < ApplicationRecord
  paginates_per  5
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :consents, dependent: :destroy
  has_many :passwords, dependent: :destroy
  has_many :usertabls, dependent: :destroy
  has_many :settings, dependent: :destroy
  validates :titletopic, presence: true,
                    length: { in: 3..300 },
                    uniqueness: {scope: :idreg}


  validates :countquestions, numericality: true, presence: true,
                    length: { in: 1..3 }
  validates :sucquest, numericality: true, presence: true,
                    length: { in: 1..3 }
  validates :timetask, presence: true
  validates :intdate1, presence: true
  validates :password, length: { in: 3..20 }, allow_blank: true
  validates :idreg, numericality: true, presence: true, if: :user_validation?
  validates :successmessage, length: { in: 3..300 }, allow_blank: true
  validates :failuremessage, length: { in: 3..300 }, allow_blank: true
  validates :activ, length: { in: 3..5 }, presence: true
  validates :rand, length: { in: 3..5 }, presence: true
  validates :codecreator, presence: true

  private
    def user_validation?
      if User.find_by(id: self.idreg)
        if User.find_by(id: self.idreg).encrypted_password != self.codecreator
          errors.add(:idreg, "Ошибка")
        end
      else
        errors.add(:idreg, "Ошибка")
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
