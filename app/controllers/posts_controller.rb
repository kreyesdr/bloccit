class PostsController < ApplicationController
  def index
    @post = Post.all
    @post.each_with_index { |post, index |
      if index % 5 == 0
        post.title = "SPAM"
      end
    }
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:posts][:title]
    @posts.body = params[:posts][:body]

    if @post.save
      flash[:notice] = "Post was saved successfully"
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving the post. Please try again"
      render :new
    end
  end

  def edit
  end
end
