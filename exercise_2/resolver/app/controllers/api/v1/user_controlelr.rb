module Api
  module V1
    class UsersController < BaseController
      before_action :prepare_user, only: %i[follow unfollow followings followers new_followers]

      def follow
        UserRelationship.create!(follower_id: @current_user.id, followed_id: @other_user.id)
      end

      def unfollow
        UserRelationship.where(follower_id: @current_user.id, followed_id: @other_user.id).destroy_all
      end

      def followings
        @current_user.followings
      end

      def followers
        @current_user.followeds
      end

      def new_followers
        @current_user.followeds.where(created_at: DateTime.current.beginning_of_month.beginning_of_day..DateTime.current.end_of_month.end_of_day)
      end

      private

      def prepare_idea
        @current_user = User.find(params[:id])
      end

      def other_user
        @other_user = User.find(params[:other_user_id])
      end
    end
  end
end
