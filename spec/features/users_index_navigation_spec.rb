# spec/features/users_index_navigation_spec.rb

require 'rails_helper'

RSpec.feature 'UsersIndices Navigation', type: :feature do
  let!(:user1) { create(:user, name: 'Tom', bio: 'Teacher from Mexico.') }
  let!(:user2) { create(:user, name: 'Lilly', bio: 'Teacher from USA.') }
  let!(:post1) { create(:post, author: user1, title: 'Hello', text: 'This is my first post') }

  before { visit users_path }

  scenario "Clicking on a user redirects to the user's show page" do
    click_link 'Tom'
    expect(page).to have_current_path(user_path(user1.id))
  end
end
