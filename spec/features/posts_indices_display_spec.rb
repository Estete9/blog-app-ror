# spec/features/posts_indices_display_spec.rb

require 'rails_helper'

RSpec.feature 'PostsIndices Display', type: :feature do
  let!(:user1) { User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0) }
  let!(:posts) do
    (1..7).map do |_i|
      Post.create(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 3)
    end
  end
  let!(:comment1) { Comment.create(post: posts.first, user: user1, text: 'first! Hi, I\'m Tom!') }
  let!(:comment2) { Comment.create(post: posts.first, user: user1, text: 'second! Hi I\'m also Tom!') }

  before { visit user_posts_path(user1.id) }

  scenario "I can see the user's profile picture, username, and the number of posts written" do
    expect(page).to have_css("img[src*='#{user1.photo}']")
    expect(page).to have_content('Tom')
    expect(page).to have_content(user1.posts_counter)
  end

  scenario 'I can see the title and some of the body of each post' do
    posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content('This is my first post')
    end
  end
end
