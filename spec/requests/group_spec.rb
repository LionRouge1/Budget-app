require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before :each do
    @user = User.create(fullname: 'Matchoudi', email: 'matchoudi@test.com', password: '123456789')
    @group = @user.groups.create(name: 'Beef', icon: 'http//image.com/toto.png')
    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
  end

  describe 'GET #index' do
    before(:example) { get '/' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('index')
    end

    it 'should include "List of foods"' do
      expect(response.body).to include('Categories')
    end
  end
end
