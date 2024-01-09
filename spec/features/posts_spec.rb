require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  context 'posts#index page' do
    let(:create_objects) do
      @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0)
      @post1 = Post.create(author: @user1, title: 'first', text: 'This is my first post', comments_counter: 0, likes_counter: 3)
      @post2 = Post.create(author: @user1, title: 'second', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
      @post3 = Post.create(author: @user1, title: 'third', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
      @post4 = Post.create(author: @user1, title: 'fourth', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)
      @post5 = Post.create(author: @user1, title: 'fifth', text: 'This is my fifth post', comments_counter: 0, likes_counter: 0)
      @post6 = Post.create(author: @user1, title: 'sixth', text: 'This is my sixth post', comments_counter: 0, likes_counter: 0)
      @post7 = Post.create(author: @user1, title: 'seventh', text: 'This is my seventh post', comments_counter: 0, likes_counter: 0)
      @comment1 = Comment.create(post: @post1, user: @user1, text: 'first! Hi, I\'m Tom!' )
      @comment2 = Comment.create(post: @post1, user: @user1, text: 'second! Hi I\'m also Tom!' )
    end

    before do
      create_objects
      visit user_posts_path(@user1.id)
    end

    scenario "I can see the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user1.photo}']")
    end

    scenario "I can see the user's username" do
      expect(page).to have_content('Tom')
    end

    scenario 'I can see the number of posts the user has written' do
      expect(page).to have_content(@user1.posts_counter)
    end

    scenario "I can see a post's title" do
      expect(page). to have_content('first')
    end

    scenario "I can see some of the post's body" do
      expect(page). to have_content('first post')
    end

    scenario 'I can see the first comment on a post' do
      expect(page). to have_content("first! Hi, I'm Tom")
    end

    scenario 'I can see how many comments a post has' do
      expect(page).to have_content(@post1.comments_counter)
    end

    scenario 'I can see how many likes a post has' do
      expect(page).to have_content(@post1.likes_counter)
    end

    scenario 'I can see a section for pagination if there are more posts than fit on the view' do
      pagination_btn = find('button', text: 'Pagination', wait: 10)

      expect(pagination_btn).to be_present
    end

    scenario "When I click on a post, it redirects me to that post's show page" do
      post_element = find('a', text: 'first')
      post_element.click

      expect(page).to have_current_path(user_post_path(@post1.author_id, @post1.id))
    end
  end

  context 'posts#show page' do
    let(:create_objects) do
      @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0)
      @post1 = Post.create(author: @user1, title: 'first', text: 'This is my first post', comments_counter: 0, likes_counter: 3)
      @comment1 = Comment.create(post: @post1, user: @user1, text: 'first! Hi, I\'m Tom!' )
      @comment2 = Comment.create(post: @post1, user: @user1, text: 'second! Hi I\'m also Tom!' )
    end

    before do
      create_objects
      visit user_post_path(@post1.author_id, @post1.id)
    end

    scenario "I can see the post's title" do
      within('.post-deetails-header') do
        expect(page).to have_content('first')
      end
    end

    scenario 'I can see who wrote the post' do
      within('.post-deetails-header') do
        expect(page).to have_content('Tom')
      end
    end

    scenario 'I can see how many comments it has' do
      within('.post-details') do
        expect(page).to have_content(@post1.comments_counter)
      end
    end
    scenario 'I can see how many likes it has' do
      within('.post-details') do
        expect(page).to have_content(@post1.likes_counter)
      end
    end

    scenario 'I can see the post body' do
      within('.post-details') do
        expect(page).to have_content(@post1.text)
      end
    end
  end
end
