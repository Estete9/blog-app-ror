# spec/features/users_show_navigation_spec.rb

require 'rails_helper'

require 'pry'

RSpec.feature 'UsersShows Navigation', type: :feature do
  context 'users#show page navigating to related pages' do
    let!(:user) do
      User.create(
        name: 'Tom',
        photo: 'https://picsum.photos/100',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    end

    let!(:posts) do
      (1..6).map do |i|
        Post.create(
          author: user,
          title: "#{i.ordinalize} post",
          text: "This is my #{i.ordinalize} post",
          comments_counter: 0,
          likes_counter: 0
        )
      end
    end

    before { visit user_path(user.id) }

    scenario "When I click a user's post, it redirects me to that post's show page" do
      find('a', text: '6th').click

      expect(page).to have_current_path(user_post_path(posts[-1].author_id, posts[-1].id))
    end

    scenario "When I click to see all posts, it redirects me to the user's post's index page" do
      find('button', text: 'See all posts').click

      expect(page).to have_current_path(user_posts_path(posts[-1].author_id))
    end
  end
end
