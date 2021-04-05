class App
    attr_accessor :user_profiles
    def initialize
        @user_profiles = []        
    end
    
    def add_user_profile(user_profile_input)
        @user_profiles << { user_profile: user_profile_input, medication_taken: false }
    end

    def display_add_user_profile
        puts 'Enter name and medication details'        
    end

    def user_profile_add
        gets.strip        
    end
end