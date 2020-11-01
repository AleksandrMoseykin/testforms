FactoryBot.define do
  factory :taskform do
    titletask { "MyString" }
    countquestions { 1 }
    password { "MyText" }
    idreg { 1 }
    successmessage { "MyText" }
    failuremessage { "MyText" }
    activ { "MyText" }
    sucquest { "MyText" }
    email { "MyText" }
    rand { "MyText" }
  end
end
