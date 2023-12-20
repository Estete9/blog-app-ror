require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET /users/index' do
    before do
      get users_path
    end

    it 'response is successful' do
      expect(response).to be_successful
    end

    it 'response renders the correct page' do
      expect(response.body).to render_template('index')
    end

    it 'contains the correct text in the body' do
      expect(response.body).to include('User Name')
    end
  end
end
