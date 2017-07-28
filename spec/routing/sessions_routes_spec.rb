require 'rails_helper'

describe 'sessions routes' do

  it 'routes get sessions/new to the SessionsController#new' do
      expect(get: '/sessions/new').to route_to(
      controller: 'sessions',
      action: 'new'
    )
  end
  it 'routes get login to the SessionsController#new' do
      expect(get: '/login').to route_to(
      controller: 'sessions',
      action: 'new'
    )
  end
  it 'routes delete sessions/:id to the SessionsController#destroy' do
      expect(delete: '/sessions/2').to route_to(
      controller: 'sessions',
      action: 'destroy',
      id: '2'
    )
  end
  it 'routes delete logout to the SessionsController#destroy' do
      expect(delete: '/logout').to route_to(
      controller: 'sessions',
      action: 'destroy'
    )
  end
  it 'routes post sessions to the SessionsController#create' do
      expect(post: '/sessions').to route_to(
      controller: 'sessions',
      action: 'create'
    )
  end
end
