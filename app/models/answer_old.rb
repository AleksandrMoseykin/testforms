class Answer < ApplicationRecord
  belongs_to :topic

    incl = []

    inclus = Question.where(topic_id: topic.id).each do |inclus|
      incl.push(inclus.id)
    end

    inclusion_validation = incl.join(" ")

  validates :questionid, presence: true,
                          inclusion: { in: %w(368 369)}
                          #uniqueness: {scope: :userid}
  validates :userid, presence: true
end
