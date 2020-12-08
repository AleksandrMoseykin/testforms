class Visitor < ApplicationRecord
  validates :photo, file_size: { less_than: 1.megabytes }
  mount_uploader :photo, ImageUploader
  validates :name, length: { in: 2..25 }, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true
  validates :surname, length: { in: 3..25 }, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true
  validates :telephone, length: { in: 3..25 }, format: { with: /\A[0-9\s+-]+\z/}, presence: true
  validates :birthdate, presence: true
  validates :country, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true
  validates :city, format: { with: /\A[А-Я][а-яё]+\z/}, presence: true
  validates :idregvis, presence: true
  validates :sex, presence: true
  validates :promocode, length: { in: 3..300 }, allow_blank: true
  validates :codevisitor, presence: true


  private

end
