class Post < ActiveRecord::Base
  has_many :comments

  after_create do
    if id % 5 == 1
      self.title = "SPAM"
      save
    end
  end
end
