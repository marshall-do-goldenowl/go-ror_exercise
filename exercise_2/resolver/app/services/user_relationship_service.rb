class UserRelationshipService
  def initialize(user, other_user)
    @user = user
    @other_user = other_user
  end

  def follow(current_user, other_user)
    UserRelationship.create!(follower_id: current_user.id, followed_id: other_user.id)
  end

  def unfollow(current_user, other_user)
    UserRelationship.where(follower_id: current_user.id, followed_id: other_user.id).destroy_all
  end

  def followings(current_user)
    current_user.followings
  end

  def followers(current_user)
    current_user.followeds
  end

  def new_followers(current_user)
    current_user.followeds.where(created_at: DateTime.current.beginning_of_month.beginning_of_day..DateTime.current.end_of_month.end_of_day)
  end
end
