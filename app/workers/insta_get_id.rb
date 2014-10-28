class InstaGetId
  include SideKiq::Worker

  def perform(user_instagram_name)
    client.user_search(user_instagram_name).first.id
  end
end

