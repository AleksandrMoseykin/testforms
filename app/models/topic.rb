class Topic < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :consents, dependent: :destroy
  has_many :passwords, dependent: :destroy
  has_many :usertabls, dependent: :destroy
  has_many :settings, dependent: :destroy
  validates :titletopic, presence: true,
                    length: { minimum: 3 }
  validates :countquestions, presence: true, length: { minimum: 1 }
  validates :sucquest, presence: true, length: { minimum: 1 }
end
