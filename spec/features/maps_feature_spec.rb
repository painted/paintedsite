require 'rails_helper'

describe 'maps' do

	context 'categories with addresses' do

		before do 
			bob = Admin.create(email: 'a@example.com', password: '12345678', password_confirmation: '12345678')
			login_as bob
			visit '/categories/new'
			fill_in 'Title', with: 'Pic1'
			fill_in 'Description', with: 'Lorem Ipsum'
			attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
			fill_in 'Url', with: 'http://www.paintedltd.co.uk'
			fill_in 'Address', with: '25 City Road, London'
			click_button 'Submit'
		end

		it 'displays a map (needs internet)', js:true do
			visit '/categories'
			click_link 'Map'
			expect(page).to have_css '.gm-style'
		end
	end
end