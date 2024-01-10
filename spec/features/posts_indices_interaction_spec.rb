# spec/features/posts_indices_interaction_spec.rb

require 'rails_helper'

RSpec.feature 'PostsIndices Interaction', type: :feature do
  let!(:user1) { create(:user, name: 'Tom') }
  let!(:post1) { create(:post, author: user1, title: 'first', text: 'This is my first post', likes_counter: 3) }
  let!(:comment1) { create(:comment, post: post1, user: user1, text: 'first! Hi, I\'m Tom!') }
  let!(:comment2) { create(:comment, post: post1, user: user1, text: 'second! Hi I\'m Tom!') }

  before { visit user_posts_path(user1.id) }

  scenario 'I can see the first comment, comments count, and likes count on a post' do
    expect(page).to have_content("first! Hi, I'm Tom")
    expect(page).to have_content(post1.comments_counter)
    expect(page).to have_content(post1.likes_counter)
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    pagination_btn = find('button', text: 'Pagination', wait: 10)
    expect(pagination_btn).to be_present
  end

  scenario "Clicking on a post redirects me to that post's show page" do
    click_link 'first'
    expect(page).to have_current_path(user_post_path(post1.author_id, post1.id))
  end
end
