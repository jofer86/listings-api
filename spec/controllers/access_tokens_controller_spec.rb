require 'rails_helper'

RSpec.describe AccessTokensController, type: :controller do
  describe '#create' do
    context 'when invalid request' do
      let(:error) do
       {            
          "status" => "401",
          "source" => { "pointer" => "/code" },
          "title" =>  "Authentication code is invalid",
          "detail" => "A valid code must be provided in order to exchange it for token."
        }
      end
      it 'should return a 401 status code' do
        post :create
        expect(response).to have_http_status(401)
      end

      it 'should return an error in a valid format' do
        post :create
        expect(json['errors']).to include(error)
      end

    end

    context 'when valid request' do
      
    end
  end
end
