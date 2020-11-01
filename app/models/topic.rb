class Topic < ApplicationRecord
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
  validates :idreg, numericality: true, presence: true
  validates :successmessage, length: { in: 3..300 }, allow_blank: true
  validates :failuremessage, length: { in: 3..300 }, allow_blank: true
  validates :activ, length: { in: 3..5 }, presence: true
  validates :rand, length: { in: 3..5 }, presence: true
  validates :codecreator, presence: true

  before_validation :user_validtion

  private
    def user_validtion
        if self.codecreator != User.find_by(id: self.idreg).encrypted_password
          valid = User.find_by(encrypted_password: self.codecreator).id
          valid.save!
        end
    end

end
