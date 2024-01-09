require 'rails_helper'
require 'pry'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/index' do
    let(:valid_attributes) do
      {
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      }
    end


    before do
      @user = User.create! valid_attributes
      get users_path
    end

    it 'response is successful' do
      expect(response).to be_successful
    end

    it 'response renders the correct page' do
      expect(response.body).to render_template('index')
    end

    it 'contains the correct text in the body' do
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET /users/show' do
    let(:valid_attributes) do
      {
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      }
    end

    let(:user) { User.create! valid_attributes }

    before do
      get user_path(id: user.id)
    end

    it 'response is successful' do
      expect(response).to be_successful
    end

    it 'response renders the correct page' do
      expect(response.body).to render_template('show')
    end

    it 'contains the correct text in the body' do


      expect(response.body).to include('Bio')
    end
  end
end
