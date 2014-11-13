class InstaGetId

  def perform(user_instagram_name)
    Instagram.user_search(user_instagram_name).first.id
  end
end

