require 'rails_helper'

RSpec.feature "UsersIndices", type: :feature do
  context 'users#index page' do
    let(:create_objects) do
      @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
      @user2 = User.create(name: 'Lilly', photo: 'https://picsum.photos/100', bio: 'Teacher from USA.',
                           posts_counter: 0)
      @post1 = Post.create(author: @user1, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
    end

    before do
      create_objects
      visit users_path
    end

    scenario 'I can see the username of all other users' do
      [@user1, @user2].each do |user|
        expect(page).to have_content(user.name)
      end
    end

    scenario 'I can see the profile picture for each user' do
      [@user1, @user2].each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    scenario 'I can see the number of posts each user has written' do
      [@user1, @user2].each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      user_element = find('a', text: 'Tom')
      user_element.click

      expect(page).to have_current_path(user_path(@user1.id))
    end
  end
end
