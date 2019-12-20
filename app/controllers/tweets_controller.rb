class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  
  def index
    @user = current_user
    @tweets = Tweet.all.order(created_at: 'desc')
  end

  def show
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
      render "new"
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:sentence)
    end
end
