require 'rails_helper'

RSpec.describe Topic, type: :model do
  it "Topic titletopic true" do
      titletopic = Topic.new(titletopic: "")
      titletopic.valid?
      titletopic.errors[:titletopic]
    end
end
