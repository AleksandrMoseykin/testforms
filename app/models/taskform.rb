class Taskform < ApplicationRecord
  has_many :issues, dependent: :destroy
  has_many :accepts, dependent: :destroy
  has_many :youanswers, dependent: :destroy
end
