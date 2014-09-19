require 'rails_helper'

describe 'categories listing page' do 
	it 'tells me that there are no categories' do 
		visit '/categories'
		expect(page).to have_content 'No categories yet'
	end

	# No longer valid as categories need to have images
	# context 'with categories' do 
	# 	before do
	# 		Category.create(title: 'Bio')
	# 	end
	# 	it 'should show the category' do 
	# 		visit '/categories'
	# 		expect(page).to have_content 'Bio'
	# 	end
	# end
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

		# it 'adds the category to the home page' do 
		# 	visit '/categories/new'
		# 	fill_in 'Title', with: 'Bio'
		# 	fill_in 'Description', with: 'Lorem Ipsum'
		# 	click_button 'Submit'
		# 	expect(current_path).to eq categories_path
		# 	expect(page).to have_content 'Bio'
		# 	expect(page).to have_content 'Lorem Ipsum'
		# end
		it 'no longer adds the category to the home page if no image is included' do 
			visit '/categories/new'
			fill_in 'Title', with: 'Bio'
			fill_in 'Description', with: 'Lorem Ipsum'
			click_button 'Submit'
			expect(current_path).to eq new_category_path
			expect(page).to have_content 'You must add an image'
		end

		it 'can add category to the homepage with photo' do 
			visit '/categories/new'
			fill_in 'Title', with: 'Bio'
			fill_in 'Description', with: 'Lorem Ipsum'
			attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
			click_button 'Submit'
			expect(current_path).to eq categories_path
			expect(page).to have_content 'Bio'
			expect(page).to have_content 'Lorem Ipsum'
			expect(page).to have_css('a', 'img.uploaded-pic') 
		end

		it 'can add a url as an image link' do 
			visit '/categories/new'
			fill_in 'Title', with: 'Bio'
			fill_in 'Description', with: 'Lorem Ipsum'
			attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
			fill_in 'Url', with: 'http://www.paintedltd.co.uk'
			click_button 'Submit'
			within '.image-link' do 
				find('a', 'uploaded-pic').click
			end
			expect(current_path).to eq '/'
		end
	end
end