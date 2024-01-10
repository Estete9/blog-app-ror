require 'rails_helper'

RSpec.feature 'UsersShowsPosts', type: :feature do
  context 'user posts' do
    let(:user) { User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let!(:posts) do
      [
        Post.create(author: user, title: 'first', text: 'This is my first post', comments_counter: 0, likes_counter: 0),
        Post.create(author: user, title: 'second', text: 'This is my second post', comments_counter: 0,
                    likes_counter: 0),
        Post.create(author: user, title: 'third', text: 'This is my third post', comments_counter: 0, likes_counter: 0),
        Post.create(author: user, title: 'fourth', text: 'This is my fourth post', comments_counter: 0,
                    likes_counter: 0),
        Post.create(author: user, title: 'fifth', text: 'This is my fifth post', comments_counter: 0, likes_counter: 0),
        Post.create(author: user, title: 'sixth', text: 'This is my sixth post', comments_counter: 0, likes_counter: 0)
      ]
    end

    before { visit user_path(user) }

    scenario "I can see the user's first 3 posts" do
      posts.last(3).each do |post|
        expect(page).to have_content(post.title)
      end
    end

    scenario "I can see a button that lets me view all of a user's posts" do
      expect(page).to have_button('See all posts')
    end
  end
end
