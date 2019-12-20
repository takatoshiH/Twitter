class RepliesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.replies.create(reply_params)
    redirect_to tweet_path(@tweet)
  end

  private
    def reply_params
      params.require(:reply).permit(:sentence)
    end
end
