require 'rails_helper'

RSpec.feature "UsersShows", type: :feature do
  context 'users#show page' do
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

    scenario "I can see the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user1.photo}']")
    end

    scenario "I can see the user's username" do
      expect(page).to have_content(@user1.name)
    end

    scenario 'I can see the number of posts the user has written' do
      expect(page).to have_content(@user1.posts_counter)
    end

    scenario "I can see the user's bio" do
      expect(page).to have_content(@user1.bio)
    end

    scenario "I can see the user's first 3 posts" do
      [@post4, @post5, @post6].each do |post|
        expect(page).to have_content(post.title)
      end
    end

    scenario "I can see a button that lets me view all of a user's posts" do
      all_posts_btn = find('button', text: 'See all posts')

      expect(all_posts_btn).to be_present
    end

    scenario "When I click a user's post, it redirects me to that post's show page" do
      post_element = find('a', text: 'sixth')
      post_element.click

      expect(page).to have_current_path(user_post_path(@post6.author_id, @post6.id))
    end

    scenario "When I click to see all posts, it redirects me to the user's post's index page" do
      all_posts_btn = find('button', text: 'See all posts')
      all_posts_btn.click
      expect(page).to have_current_path(user_posts_path(@user1.id))
    end
  end
end
