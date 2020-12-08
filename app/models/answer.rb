class Answer < ApplicationRecord
  belongs_to :topic
  validates :questionid, presence: true,
            uniqueness: {scope: :userid}
  validates :userid, numericality: { only_integer: true }, presence: true, if: :user_validation?
  validates :usercode, presence: true, if: :question_validation?

  private
    def user_validation?
      if Username.find_by(id: self.userid)
        if Username.find_by(id: self.userid).encrypted_password != self.usercode
          errors.add(:userid, "Ошибка")
        end
      else
        errors.add(:userid, "Ошибка")
      end

      if Username.find_by(encrypted_password: self.usercode)
        if Username.find_by(encrypted_password: self.usercode).id != self.userid
          errors.add(:userid, "Ошибка")
        end
      else
        errors.add(:userid, "Ошибка")
      end
    end

    def question_validation?
      if Question.find_by(id: self.questionid)
        answertrue = Question.find_by(id: self.questionid).answertrue
        answer2 = Question.find_by(id: self.questionid).answer2
        answer3 = Question.find_by(id: self.questionid).answer3
        answer4 = Question.find_by(id: self.questionid).answer4
        answeruser = self.answeruser
        unless (answertrue == answeruser or answer2 == answeruser or answer3 == answeruser or answer4 == answeruser or nil == answeruser)
          errors.add(:questionid, "Ошибка")
        end
      else
        errors.add(:questionid, "Ошибка")
      end
    end
end
