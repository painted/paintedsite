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