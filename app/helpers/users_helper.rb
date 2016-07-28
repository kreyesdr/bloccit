module UsersHelper
  def non_post_text
    if @user.posts.count === 0
      "#{@user.name} has not submitted any posts yet."
    else
       render @user.posts
    end
  end
end
