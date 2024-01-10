require 'rails_helper'

RSpec.feature 'PostsShowDisplays', type: :feature do
  let!(:user) do
    User.create(
      name: 'Tom',
      photo: 'https://picsum.photos/100',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )
  end
  let!(:post1) do
    Post.create(
      author: user,
      title: 'first',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 3
    )
  end

  before { visit user_post_path(post1.author_id, post1.id) }

  scenario "I can see the post's title, and who wrote it" do
    within('.post-deetails-header') do
      expect(page).to have_content('first')
      expect(page).to have_content('Tom')
    end
  end

  scenario 'I can see how many comments and likes it has, and the body of the post' do
    expect(page).to have_content(post1.comments_counter)
    expect(page).to have_content(post1.likes_counter)
    expect(page).to have_content(post1.text)
  end
end
