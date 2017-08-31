class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :new_post

  def show
  	@user = User.find(params[:id])

    @posts = @user.posts
    arr = []
    @pingdatas = @posts.each do |post|
      arr << [post.latitude, post.longitude, post.address, post.name]
    end

  end

  def index
  end

  def favorites
    arr = []
    @user = User.find(params[:id])
    @pingdatas = @user.favorites.map{|fav| fav.post}
  end

  def follows
  	@user = User.find(params[:id])
  	@follows = @user.followings
  end

  def followers
  	@user = User.find(params[:id])
  	@followers = @user.followers
  end

  private
    def new_post
      @post = Post.new
    end
  

end
