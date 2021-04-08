class App
    attr_accessor :user_profiles
    def initialize
        @user_profiles = []        
    end
    
    def add_user_profile(user_profile_input)
        @user_profiles << { user_profile: user_profile_input, medication_taken: false }
    end

    def change_user_profile(edited_user_profile, index)
        @user_profiles[index][:user_profile] = edited_user_profile
    end

    def delete_user_profile(index)
        @user_profiles.delete_at(index)        
    end

    def toggle_medication_taken(index)
        @user_profiles[index][:medication_taken] = !@user_profiles[index][:medication_taken]        
    end

    def display_add_user_profile
        puts 'Enter name and medication details'        
    end

    def user_profile_add
        gets.strip        
    end
    
    def display_user_profiles
        puts "User Profile:"
        @user_profiles.each_with_index do |user_profile,index|
            puts "#{index +1}. #{user_profile[:user_profile]} [#{user_profile[:medication_taken] ? 'X' : ' '}]"
        end
    end

    def display_new_user_profile
        puts 'Please enter new medication details'       
    end

    def display_select_user_profile
        puts 'Please enter the user profile number:'
        
    end

    def select_user_profile
        gets.to_i - 1
    end



end