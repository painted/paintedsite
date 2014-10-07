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

		context 'existing posts' do 
			before do 
				visit '/categories/new'
				fill_in 'Title', with: 'Pic1'
				fill_in 'Description', with: 'Lorem Ipsum'
				attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
				fill_in 'Url', with: 'http://www.paintedltd.co.uk'
				fill_in 'Tags', with: 'yolo'
				click_button 'Submit'

				visit '/categories/new'
				fill_in 'Title', with: 'Pic2'
				fill_in 'Description', with: 'Lorem Ipsum'
				attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
				fill_in 'Url', with: 'http://www.paintedltd.co.uk'
				fill_in 'Tags', with: 'swag'
				click_button 'Submit'
			end


			it 'should filter categories by selected tag' do 				
				click_link 'yolo'
				expect(page).to have_css 'h1', 'Categories associated with Yolo'
				expect(page).to have_content 'Pic1'
				expect(page).not_to have_content 'Pic2'
			end

			it 'uses the tag name in the url' do 
				click_link 'yolo'
				expect(current_path).to eq '/tags/yolo'
			end
		end
	end 
end
