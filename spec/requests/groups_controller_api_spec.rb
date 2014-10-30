require 'rails_helper'

describe 'Group API' do
  it 'returns all groups' do
    5.times { Group.create }

    get '/api/v1/groups.json'
    json = JSON.parse(response.body)
    expect(json['groups'].count).to eq(5)
  end

  it 'returns a specific group' do
    group      = Group.new
    group.name = 'Breck Boarders'
    group.save

    get "/api/v1/groups/#{group.id}.json"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['group']['name']).to eq('Breck Boarders')
  end

  it 'creates a new group' do
    post '/api/v1/groups.json', group: { name: 'Breck Boarders' }

    expect(response).to be_success

    group = Group.last
    expect(group.name).to eq('Breck Boarders')
  end

end