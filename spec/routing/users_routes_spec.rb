require 'rails_helper'

describe 'User routes' do
  it 'routes get users/new to the UsersController#new' do
      expect(get: '/users/new').to route_to(
      controller: 'users',
      action: 'new'
    )
  end
  it 'routes get users/:id to the UsersController#show' do
      expect(get: '/users/2').to route_to(
      controller: 'users',
      action: 'show',
      id: '2'
    )
  end
  it 'routes post users to the UsersController#create' do
      expect(post: '/users').to route_to(
      controller: 'users',
      action: 'create'
    )
  end

end
