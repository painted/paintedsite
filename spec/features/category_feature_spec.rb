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