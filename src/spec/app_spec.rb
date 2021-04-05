require_relative '../lib/app'

RSpec.describe App do
	subject(:app){
		described_class.new
	} 
	it 'should be an instance of App' do
		expect(app).to be_a App 
	end

	it 'should have an empty list of user profiles' do
		expect(app.user_profiles).to eq []
	end
	context 'adding a user_profile' do
		it 'should be able to add a user profile' do
			app.add_user_profile('Create a user profile')
			expect(app.user_profiles.last).to eq  ({user_profile: 'Create a user profile', medication_taken: false })
		end

		it 'should ask user for input' do
			
		end
	end
end