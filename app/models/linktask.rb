class Linktask < ApplicationRecord
  validates :codecreator, presence: true
  validates :idcreator, numericality: true, presence: true
  validates :userid, numericality: true, presence: true
  validates :userid, numericality: true, presence: true



  private

end
