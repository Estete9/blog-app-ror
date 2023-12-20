require 'rails_helper'

# require 'pry'

RSpec.describe 'Posts', type: :request do
  let(:valid_attributes) do
    {
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    }
  end

  describe 'GET /posts' do
    it 'response is successful' do
      user = User.create! valid_attributes
      get user_posts_path(user_id: user.id)

      # binding.pry

      expect(response).to be_successful
    end
  end
end
