class Consent < ApplicationRecord
  belongs_to :topic
  validates :userid, numericality: true, presence: true,
                          uniqueness: {scope: :topic_id}
end
