class FavoriteMailer < ApplicationMailer
  default from: 'kreyes611@gmail.com'

  def new_comment(user,post,comment)
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}", cc: 'joseph.caudle@bloc.io')
  end

end