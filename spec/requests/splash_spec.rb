require 'rails_helper'

RSpec.describe "Splashes", type: :request do
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
  end
  describe "GET /index" do
    before do
      get budget_wiz_path
    end
    it 'redirects to the splash page' do
      get root_path
      expect(response).to redirect_to(budget_wiz_path)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Budget'
    end

  end
end
