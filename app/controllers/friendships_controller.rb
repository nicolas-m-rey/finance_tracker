class FriendshipsController < ApplicationController
    def create
        friend = User.find params.require(:friend)
        current_user.friendships.build(friend_id: friend.id)
        if current_user.save
            flash[:notice] = "Following friend"
        else
            flash[:alert] = "There was something wrong with the tracking request"
        end
        redirect_to my_friends_path

    end

    def destroy
        friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id]).first
        friendship.destroy
        flash[:notice] = "Stopped following"
        redirect_to my_friends_path
    end
end
