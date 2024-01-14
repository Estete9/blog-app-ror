
require 'swagger_helper'
require 'faker'
require 'pry'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

RSpec.describe 'Api::V1::Posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
   before do
      DatabaseCleaner.start
    end

    after do
      DatabaseCleaner.clean
    end

    get('list posts') do
      tags 'Posts'
      produces 'application/json'
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

      response '200', 'posts found' do
        user_attributes = {
          name: Faker::Name.name,
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: Faker::Lorem.sentence,
          posts_counter: 0,
          email: Faker::Internet.email,
          password: 123456
        }

        user = User.create!(user_attributes)

        post_attributes = {
          author: user,
          title: 'hello',
          text: Faker::Lorem.sentence,
          likes_counter: 0,
          comments_counter: 0
        }

        let(:user_id) { user.id }
        post = Post.create!(post_attributes)

        run_test! do |response|
          json_response = JSON.parse(response.body)
          expect(json_response[0]['title']).to eq('hello')
        end

        # binding.pry
      end
    end
  end
end
