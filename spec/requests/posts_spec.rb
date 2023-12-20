require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user_valid_attributes) do
    {
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    }
  end

  describe 'GET /posts/index' do
    before do
      @user = User.create! user_valid_attributes
      get user_posts_path(user_id: @user.id)
    end

    it 'response is successful' do
      expect(response).to be_successful
    end

    it 'response renders the correct page' do
      expect(response.body).to render_template('index')
    end

    it 'contains the correct text in the body' do
      expect(response.body).to include('Post #1')
    end
  end

  describe 'GET /posts/show' do
    before do
      @user = User.create! user_valid_attributes
      @post = Post.create! post_valid_attributes
      get user_post_path(user_id: @user.id, id: @post.id)
    end

    let(:post_valid_attributes) do
      {
        author: @user,
        title: 'hello',
        text: 'This is my first post',
        likes_counter: 0,
        comments_counter: 0
      }
    end

    it 'response is successful' do
      expect(response).to be_successful
    end

    it 'response renders the correct page' do
      expect(response.body).to render_template('show')
    end

    it 'contains the correct text in the body' do
      expect(response.body).to include('Post #1')
    end
  end
end
