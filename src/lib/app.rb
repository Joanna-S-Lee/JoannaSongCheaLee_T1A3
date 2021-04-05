class App
    attr_accessor :user_profiles
    def initialize
        @user_profiles = []        
    end
    
    def add_user_profile(user_profile_input)
        @user_profiles << { user_profile: user_profile_input, medication_taken: false }
    end
end