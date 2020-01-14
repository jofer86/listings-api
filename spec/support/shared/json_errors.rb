require 'rails_helper'

shared_examples_for 'unauthorized_requests' do
  let(:authentication_error) do
    {            
       "status" => "401",
       "source" => { "pointer" => "/code" },
       "title" =>  "Authentication code is invalid",
       "detail" => "A valid code must be provided in order to exchange it for token."
     }
  end

  it 'should return a 401 status code' do
    subject
    expect(response).to have_http_status(401)
  end

  it 'should return an error in a valid format' do
    subject
    expect(json['errors']).to include(authentication_error)
  end
end

shared_examples_for 'forbidden_request' do
  let(:authorization_error) do
    {            
       "status" => "403",
       "source" => { "pointer" => "/headers/authorization" },
       "title" =>  "Not authorized",
       "detail" => "You are not allowed to access this resource."
     }
  end

  it 'should return 403 status code' do
    subject
    expect(response).to have_http_status(:forbidden)
  end
  it 'should return proper error in json format' do
    subject
    expect(json['errors']).to include(authorization_error)
  end
end