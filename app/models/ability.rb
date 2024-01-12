# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read [Post, Comment, Like]

    if user.is? :admin
      can :manage [Post, Comment, Like]
    else
      can :read Post
      can :destroy [Comment, Like]
    end
  end
end
