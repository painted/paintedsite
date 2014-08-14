require 'rails_helper'

describe 'categories listing page' do 
	it 'tells me that there are no categories' do 
		visit '/categories'
		expect(page).to have_content 'No categories yet'
	end
end