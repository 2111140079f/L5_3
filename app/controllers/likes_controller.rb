class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        #user = User.find_by(uid: current_user)
        #user.like_tweets << tweet
        
        unless tweet.liked?(current_user)
            tweet.like(current_user)
        end
        redirect_to root_path    #rootはツイート一覧画面
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        # user = User.find_by(uid: current_user)
        # tweet.likes.find_by(user_id: user.id).destroy
        if tweet.liked?(current_user)
            tweet.unlike(current_user)
        end
        redirect_to root_path
    end
end