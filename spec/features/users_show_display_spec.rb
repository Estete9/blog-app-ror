# spec/features/users_show_displays_spec.rb

require 'rails_helper'

RSpec.feature 'UsersShowDisplays', type: :feature do
  let(:user) do
    User.create(
      name: 'Tom',
      photo: 'https://picsum.photos/100',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )
  end

  let!(:posts) do
    (1..6).map do |i|
      Post.create(
        author: user,
        title: "post #{i}",
        text: "This is my #{i.ordinalize} post",
        comments_counter: 0,
        likes_counter: 0
      )
    end
  end

  before { visit user_path(user.id) }

  scenario "I can see the user's profile picture, username, post count, and bio" do
    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.posts_counter)
    expect(page).to have_content(user.bio)
  end
end
