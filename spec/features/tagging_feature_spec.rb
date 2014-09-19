require 'rails_helper'

describe 'tagging category with link' do
	context 'when logged in' do

		before do 
			bob = Admin.create(email: 'bob@bob.com', password: '12345678', password_confirmation: '12345678')
			login_as bob
		end

		it 'adds the category to the homepage' do 
			visit '/categories/new'
			fill_in 'Title', with: 'Bio'
			fill_in 'Description', with: 'Lorem Ipsum'
			attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
			fill_in 'Url', with: 'http://www.paintedltd.co.uk'
			fill_in 'Tags', with: 'yolo, swag'
			click_button 'Submit'

			expect(page).to have_link 'yolo'
			expect(page).to have_link 'swag'
		end
	end 
end
