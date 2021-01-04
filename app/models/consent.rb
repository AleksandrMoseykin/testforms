class Consent < ApplicationRecord
  paginates_per  20
  belongs_to :topic
  validates :userid, numericality: true, presence: true,
                          uniqueness: {scope: :topic_id}
  validates :code, presence: true, if: :user_validation?

  private

  def user_validation?
    if Username.find_by(id: self.userid)
      if Username.find_by(id: self.userid).encrypted_password != self.code
        errors.add(:userid, "Ошибка")
      end
    else
      errors.add(:userid, "Ошибка")
    end

    if Username.find_by(encrypted_password: self.code)
      if Username.find_by(encrypted_password: self.code).id != self.userid
        errors.add(:userid, "Ошибка")
      end
    else
      errors.add(:userid, "Ошибка")
    end
  end
end
