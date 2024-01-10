# spec/features/users_index_display_spec.rb

require 'rails_helper'

RSpec.feature 'UsersIndices Display', type: :feature do
  let!(:user1) { create(:user, name: 'Tom') }
  let!(:user2) { create(:user, name: 'Lilly') }
  let!(:post1) { create(:post, author: user1, title: 'Hello', text: 'This is my first post') }

  before { visit users_path }

  scenario 'I can see the username, profile picture, and post count for each user' do
    [user1, user2].each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src*='#{user.photo}']")
      expect(page).to have_content(user.posts_counter)
    end
  end

  scenario "Clicking on a user redirects to the user's show page" do
    click_link 'Tom'
    expect(page).to have_current_path(user_path(user1.id))
  end
end
