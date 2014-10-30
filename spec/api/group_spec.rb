require 'rails_helper'

describe 'Groups API' do
  it 'retrieves a specific group' do
    group = create(:group)

    get "/api/v1/groups/#{group.id}.json"
    expect(response).to be_success

    expect(json['name']).to eq(group.name)
  end

  it "can create a group" do
    group = build(:group)
    json = group.to_json
    count = Group.count
    
    post "/api/v1/groups.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
    
    expect(Group.count).to eq(count + 1)
    expect(response).to be_success
  end

  it "can update a group" do
    group = create(:group)
    group.name = "New name!"
    json = group.to_json
    
    put "/api/v1/groups/#{group.id}.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

    expect(response).to be_success
    expect(group.name).to eq("New name!")
  end

  it "can destroy a group" do
    group = create(:group)
    json = group.to_json
    count = Group.count
    
    delete "/api/v1/groups/#{group.id}.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

    expect(response).to be_success
    expect(Group.count).to eq(count - 1)
  end
end
