require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:create_users) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    @user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from USA.', posts_counter: 0)
  end

  scenario "displays a list with the users' names" do
    create_users

    visit users_path

    [@user1, @user2].each do |user|
      expect(page).to have_content(user.name)
    end
  end
end
