require 'rails_helper'

describe 'Groups API' do
  it 'retrieves a specific group' do
    group = create(:group)

    get "/api/v1/groups/#{group.id}.json"
    expect(response).to be_success

    expect(json['name']).to eq(group.name)
  end
end
