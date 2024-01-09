require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:create_users) do
    @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0)
    @user2 = User.create(name: 'Lilly', photo: 'https://picsum.photos/100', bio: 'Teacher from USA.', posts_counter: 0)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  end

  context 'users#index page' do
    scenario 'I can see the username of all other users' do
      create_users

      visit users_path

      [@user1, @user2].each do |user|
        expect(page).to have_content(user.name)
      end
    end

    scenario 'I can see the profile picture for each user' do
      create_users

      visit users_path

      [@user1, @user2].each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    scenario 'I can see the number of posts each user has written' do
      create_users

      visit users_path

      [@user1, @user2].each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      create_users

      visit users_path
      user_element = find('a', text: 'Tom')
      user_element.click

      expect(URI.parse(current_url).path).to eq(user_path(@user1.id))
    end
  end


  context 'users#show page' do
    scenario "I can see the user's bio" do
      create_users

      visit user_path(@user1.id)

      expect(page).to have_content(@user1.bio)
    end
  end
end
