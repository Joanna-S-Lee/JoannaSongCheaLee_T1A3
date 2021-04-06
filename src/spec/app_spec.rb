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
			expected_output = "Enter name and medication details\n"
			expect{ app.display_add_user_profile }.to output(expected_output).to_stdout
		end
	
	let(:input) { StringIO.new('test user profile')}
		it 'should be able to receive user_profile details from terminal' do
			$stdin = input
			expect(app.user_profile_add).to eq('test user profile')	
		end
	end

	context 'displaying user profiles' do
		before(:each) do
			app.user_profiles = [{user_profile: 'test user profile', medication_taken: false}]
		end

		it 'should display all user profiles' do
			expected_output = "User Profile:\n1. test user profile [ ]\n"
			expect{ app.display_user_profiles }.to output(expected_output).to_stdout	
		end

		it 'should display medication that has been taken with a X' do
			app.user_profiles << { user_profile: 'test user profile 2', medication_taken: true }
			expected_output = "User Profile:\n1. test user profile [ ]\n2. test user profile 2 [X]\n"
			expect{ app.display_user_profiles }.to output(expected_output).to_stdout	
		end

		it 'should display medication that has not been taken with a space' do
			app.user_profiles << { user_profile: 'test user profile 2', medication_taken: false }
			expected_output = "User Profile:\n1. test user profile [ ]\n2. test user profile 2 [ ]\n"
			expect{ app.display_user_profiles }.to output(expected_output).to_stdout	
		end
	end

	context 'edit user profile' do
		before(:each) do
			app.user_profiles = [{user_profile: 'test user profile', medication_taken: false}]
		end

		it 'should display to the user to enter a user profile number' do
			expected_output = "Please enter the user profile number:\n"
			expect{ app.display_select_user_profile }.to output(expected_output).to_stdout
		end

		it 'should ask user for the new medication details' do
			expected_output = "Please enter new medication details\n"
			expect{ app.display_new_user_profile }.to output{expected_output}.to_stdout
		end

		it 'should change a user profile depending on the index' do
			app.change_user_profile('edited test user profile',0)
			expect(app.user_profiles[0][:user_profile])to eq 'edited test user profile'
		end

		describe '#select_user_profile' do
			let(:input) { StringIO.new('1') }
			it 'should return the index of user profile selected' do
				$stdin = input
				expect(app.select_user_profile).to eq(0)
			end
		end
	end
end