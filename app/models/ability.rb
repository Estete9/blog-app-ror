# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, [Post, Comment, Like]

    if user.is? :admin
      can :manage, [Post, Comment, Like]
    else
      can :create, [Comment, Like]
      can :destroy, [Post, Comment], user_id: user.id
    end
  end
end
