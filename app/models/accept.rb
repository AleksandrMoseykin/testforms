class Accept < ApplicationRecord
  belongs_to :taskform
  validates :userid, numericality: true, presence: true,
                          uniqueness: {scope: :taskform_id}
end
