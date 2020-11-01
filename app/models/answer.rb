class Answer < ApplicationRecord
  belongs_to :topic

  validates :questionid, presence: true,
            uniqueness: {scope: :userid}



  validates :userid, presence: true
  validates :usercode, presence: true

  before_validation :user_validtion
  before_validation :question_validation

  private
    def user_validtion
        if Username.find_by(id: self.userid)
          code_person = Username.find_by(id: self.userid).encrypted_password
          if code_person != self.usercode
            puts 'Ошибка'
          end
        else
          puts 'Ошибка'
        end
    end
    def question_validation
        if Question.find_by(id: self.questionid).topic_id

        end
    end
end
