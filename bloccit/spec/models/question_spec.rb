require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.new(title: 'New post title', body: 'New post body', resolved: false) }

  it 'respond to title' do
    expect(question).to respond_to(:title)
  end

  it 'should respond to body' do
    expect(question).to respond_to(:body)
  end

  it 'should respond to resolved' do
    expect(question).to respond_to(:resolved)
  end

end
