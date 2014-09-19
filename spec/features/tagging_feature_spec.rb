# require 'rails_helper'

# describe 'tagging categories' do 
# 	context 'when logged in' do 

# 		before do 
# 			admin = Admin.create email: 's@s.com', password: '12345678', password_confirmation: '12345678'
# 			login_as admin
# 		end

# 		it 'can add category with meta tags' do 
# 			visit '/categories/new'
# 			fill_in 'Title', with: 'Bio'
# 			fill_in 'Description', with: 'Lorem Ipsum'
# 			attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
# 			fill_in 'Tags', with: 'swag, yolo'
# 			click_button 'Submit'

# 			expect(current_path).to eq categories_path
# 			expect(page).to have_content 'swag'
# 			expect(page).to have_content 'yolo'
# 		end
# 	end
# end

# describe 'tagging unit' do 
# 	context 'when logged in' do 
# 		before do  
# 		admin = Admin.create email: 's@s.com', password: '12345678', password_confirmation: '12345678'
# 		login_as admin
# 		visit '/categories/new'
# 		fill_in 'Title', with: 'Bio'
# 		fill_in 'Description', with: 'Lorem Ipsum'
# 		attach_file 'Image', Rails.root.join('spec/images/paintedicon.jpeg')
# 		click_button 'Submit'
# 	end

# 		describe '#tag_names=' do 
# 			describe 'no tags' do
# 				it 'does nothing' do
# 					expect { category.tag_names = ''}.not_to raise_error
# 				end
# 			end
# 		end

# 		describe 'one tag that does not exist' do 
# 			it 'adds a tag to the category' do
# 				category.tag_names = 'yolo'
# 				expect(category.tags.length).to eq 1
# 			end
# 		end
# 	end
# end
