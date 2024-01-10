# spec/features/users_show_navigation_spec.rb

require 'rails_helper'

RSpec.feature 'UsersShows Navigation', type: :feature do
  context 'users#show page navigating to related pages' do
    let(:create_objects) do
      @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
      @post1 = Post.create(author: @user1, title: 'first', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(author: @user1, title: 'second', text: 'This is my second post', comments_counter: 0,
                           likes_counter: 0)
      @post3 = Post.create(author: @user1, title: 'third', text: 'This is my third post', comments_counter: 0,
                           likes_counter: 0)
      @post4 = Post.create(author: @user1, title: 'fourth', text: 'This is my fourth post', comments_counter: 0,
                           likes_counter: 0)
      @post5 = Post.create(author: @user1, title: 'fifth', text: 'This is my fifth post', comments_counter: 0,
                           likes_counter: 0)
      @post6 = Post.create(author: @user1, title: 'sixth', text: 'This is my sixth post', comments_counter: 0,
                           likes_counter: 0)
    end

    before do
      create_objects
      visit user_path(@user1.id)
    end

    scenario "When I click a user's post, it redirects me to that post's show page" do
      post_element = find('a', text: 'sixth')
      post_element.click

      expect(page).to have_current_path(user_post_path(@post6.author_id, @post6.id))
    end
  end
end
