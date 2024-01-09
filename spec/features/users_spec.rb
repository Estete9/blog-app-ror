require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:create_users) do
    @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0)
    @user2 = User.create(name: 'Lilly', photo: 'https://picsum.photos/100', bio: 'Teacher from USA.', posts_counter: 0)
  end

  scenario "displays a list with the users' names" do
    create_users

    visit users_path

    [@user1, @user2].each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario "displays a list with the users' photos" do
    create_users

    visit users_path

    [@user1, @user2].each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
  end

  scenario "displays a list with the users' posts counter" do
    create_users

    visit users_path

    [@user1, @user2].each do |user|
      expect(page).to have_content(user.posts_counter)
    end
  end  

  scenario "displays a list with the users' bios" do
    create_users

    visit users_path

    [@user1, @user2].each do |user|
      expect(page).to have_content(user.bio)
    end
  end
end
