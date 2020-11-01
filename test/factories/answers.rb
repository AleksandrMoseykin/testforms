FactoryBot.define do
  factory :answer do
    questionid { 1 }
    userid { 1 }
    scoreanswer { 1 }
    answeruser { "MyText" }
    topic { nil }
  end
end
