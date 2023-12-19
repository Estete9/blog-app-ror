require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0 ) }
    it "works! (now write some real specs)" do
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(200)
    end
  end
end
