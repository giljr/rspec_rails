require 'rails_helper'

RSpec.describe 'Status requests', type: :request do
  describe 'GET /status' do
    it 'returns a status message' do
      get '/status', as: :json

      expect(response).to have_http_status(:ok)

      # json = JSON.parse(response.body)
      expect(response_json['status']).to eql('ok')
    end
  end
end
