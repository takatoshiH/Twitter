class TweetsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @tweets = Tweet.all.order(created_at: 'desc')
  end

  def show
    @user = current_user
    @tweet = Tweet.find(params[:id])
  end

  def new
    @user = current_user
    @tweet = @user.tweets.new
  end

  def create
    @user = current_user
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      # render plain: @tweet.errors.inspect
      render "new"
    end
  end

  def destroy
    @user = Tweet.find(params[:id]).user
    
    if @user == current_user
      @tweet = @user.tweets.find(params[:id])
      @tweet.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:sentence)
    end
end
