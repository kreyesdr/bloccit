require 'rails_helper'

RSpec.describe Question, type: :model do
  context "attributes" do
    let (:question) { Question.new(title: 'Question title', body: 'Question Body', resolved: true) }

    it "should respond to title" do
      expect(question).to respond_to(:title)
    end

    it "should respond to body" do
      expect(question).to respond_to(:body)
    end

    it "should respond to resolved" do
      expect(question).to respond_to(:resolved)
    end
  end
end
