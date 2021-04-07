require_relative 'lib/app'

medicine = App.new
medicine.add_user_profile('user_profile 1')
medicine.add_user_profile('user_profile 2')
medicine.display_user_profiles
medicine.display_select_user_profile
index = medicine.select_user_profile
medicine.display_new_user_profile
new_user_profile = medicine.user_profile_add
medicine.change_user_profile(new_user_profile, index)
medicine.display_user_profiles


