require 'rails_helper'

describe 'listings routes' do
  it 'should route to listings index' do
    expect(get '/listings').to route_to('listings#index')
  end

  it 'should route to article show' do
    expect(get 'listings/1').to route_to('listings#show', id: '1')
  end

  it 'should route to article update' do
    expect(put 'listings/1').to route_to('listings#update', id: '1')
  end

  it 'should route to article create' do
    expect(post 'listings').to route_to('listings#create')
  end

  it 'should route to article destroy' do
    expect(delete 'listings/1').to route_to('listings#destroy', id: '1')
  end
end