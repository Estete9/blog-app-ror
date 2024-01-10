require 'rails_helper'

RSpec.feature 'AllUsersPosts', type: :feature do
  context 'view all user posts' do
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

    scenario "I can see a button that lets me view all of a user's posts" do
      all_posts_btn = find('button', text: 'See all posts')
      expect(all_posts_btn).to be_present
    end
  end
end
