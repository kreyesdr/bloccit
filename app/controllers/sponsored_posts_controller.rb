class SponsoredPostsController < ApplicationController
  def show
    @sponsored_posts = SponsoredPost.find(params[:id])
  end

  def new
    @sponsored_post = SponsoredPost.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])
git
    if @sponsored_post.save
      flash[:notice] = 'Sponsored post was created successfully'
      redirect_to @topic
    else
      flash.now[:alert] = 'Error creating topic. Please try again'
      render :new
    end
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]

    if @sponsored_post.save
      flash[:notice] = 'sponsored post was updated successfully'
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash[:alert] = 'There was an error saving the sponsored post. Please try again.'
      render :edit
    end
  end
end
