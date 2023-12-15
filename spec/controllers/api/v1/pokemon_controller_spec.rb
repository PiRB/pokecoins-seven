require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :request do
  
    describe 'GET /index' do
      context 'without pokemons' do
        it 'returns http ok' do
          get api_v1_pokemons_path
          expect(response).to have_http_status(:ok)
        end
      end

      context 'with pokemons' do
        it 'returns http ok' do
          let(:pokemons) { create_list(:pokemon, 10) }
          get api_v1_pokemons_path
          expect(response).to have_http_status(:ok)
        end
      end
    end
end