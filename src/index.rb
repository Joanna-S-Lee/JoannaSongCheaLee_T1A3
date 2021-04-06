require_relative 'lib/app'

index = App.new
index.display_user_profiles
index.display_select_user_profile
index = index.select_user_profile
index.display_new_user_profile
new_user_profile = index.user_profile_add
index.change_user_profile(new_user_profile, index)


