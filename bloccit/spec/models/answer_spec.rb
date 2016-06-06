require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.new(title: 'New Question body', body: 'New question Body', resolved: false) }
  let(:answer) { Answer.new(question: question, body: 'New body text') }
  it 'it should respond to body' do
    expect(answer).to respond_to(:body)
  end
end

