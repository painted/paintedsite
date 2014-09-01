require 'rails_helper'

describe 'categories listing page' do 
	it 'tells me that there are no categories' do 
		visit '/categories'
		expect(page).to have_content 'No categories yet'
	end

	context 'with categories' do 
		before do
			Category.create(title: 'Bio')
		end
		it 'should show the category' do 
			visit '/categories'
			expect(page).to have_content 'Bio'
		end
	end
end

describe 'category input form' do 

	context 'logged out' do 
		it 'should allow an admin to sign in' do 
			visit '/categories/new'
			expect(page).to have_content 'Sign in'
		end
	end

	context 'logged in' do 
		before do 
			admin = Admin.create email: 's@s.com', password: '12345678', password_confirmation: '12345678'
			login_as admin
		end
		it 'adds the category to the home page' do 
			visit '/categories/new'
			fill_in 'Title', with: 'Bio'
			fill_in 'Description', with: 'Lorem Ipsum'
			click_button 'Submit'
			expect(current_path).to eq categories_path
			expect(page).to have_content 'Bio'
			expect(page).to have_content 'Lorem Ipsum'
		end
	end
end