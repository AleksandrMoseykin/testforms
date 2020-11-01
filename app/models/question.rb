class Question < ApplicationRecord
  belongs_to :topic
  validates :imgquestion, file_size: { less_than: 1.megabytes }
  mount_uploader :imgquestion, PhotoUploader
  validates :titlequestion, presence: true,
                    length: { in: 3..300 }
                    #def titlequestion
                    #titlequestion = 11
                    #end
  validates :answertrue, presence: true, length: { in: 1..300 }
  validates :answer2, presence: true, length: { in: 1..300 }
  validates :answer3, presence: true, length: { in: 1..300 }
  validates :answer4, presence: true, length: { in: 1..300 }
end
