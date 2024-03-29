# spec/features/posts_show_comments_spec.rb

require 'rails_helper'

RSpec.feature 'PostsShows Comments', type: :feature do
  context 'posts#show page displaying post comments' do
    let(:create_objects) do
      @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
      @post1 = Post.create(author: @user1, title: 'first', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 3)
      @comment1 = Comment.create(post: @post1, user: @user1, text: 'first! Hi, I\'m Tom!')
      @comment2 = Comment.create(post: @post1, user: @user1, text: 'second! Hi I\'m Tom!')
    end

    before do
      create_objects
      visit user_post_path(@post1.author_id, @post1.id)
    end

    scenario 'I can see the username of each commentor' do
      within('.comments-list') do
        [@comment1, @comment2].each do |comment|
          expect(page).to have_content("#{comment.user.name}:")
        end
      end
    end

    scenario 'I can see the comment each commentor left' do
      [@comment1, @comment2].each do |comment|
        expect(page).to have_content(comment.text.to_s)
      end
    end
  end
end
