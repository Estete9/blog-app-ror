# spec/features/users_index_navigation_spec.rb

require 'rails_helper'

RSpec.feature 'UsersIndices Navigation', type: :feature do
  let!(:user1) { User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0) }
  let!(:user2) { User.create(name: 'Lilly', photo: 'https://picsum.photos/100', bio: 'Teacher from USA.', posts_counter: 0) }
  let!(:post1) do
    Post.create(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 3)
  end

  before { visit users_path }

  scenario "Clicking on a user redirects to the user's show page" do
    click_link 'Tom'
    expect(page).to have_current_path(user_path(user1.id))
  end
end
