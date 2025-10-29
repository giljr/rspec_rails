require 'rails_helper'

RSpec.describe 'Consoles requests', type: :request do
  describe 'GET /consoles' do
    # let(:json) { JSON.parse(response.body) }

    it 'returns an array of video games consoles' do
      get '/consoles', as: :json

      expect(response).to have_http_status(:ok)

      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Genesis',
        'Xbox',
        'Switch',
        'PS1',
        'PS2'
      )
    end

    it 'supports specifying consoles for a specific manufacturer' do
      get('/consoles', params: { manufacturer: 'Nintendo' })

      expect(response).to have_http_status(:ok)

      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Switch'
      )
    end
  end
end
