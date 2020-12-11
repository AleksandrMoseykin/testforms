class Usertabl < ApplicationRecord
  belongs_to :topic
  validates :userid, numericality: true, presence: true
end
