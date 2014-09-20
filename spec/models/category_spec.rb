require 'rails_helper'
require 'test_helper'

def test_image
	Rack::Test::UploadedFile.new(Rails.root.join('spec/images/paintedicon.jpeg'), 'image/jpg')
end


describe Category do

	let(:category) { Category.create(title: 'Test', image: test_image) }

	describe '#tag_names=' do 
		describe 'no tags' do
			it 'does nothing' do
				expect { category.tag_names = ''}.not_to raise_error
			end
		end
	end

	describe 'one tag that does not exist' do 
		it 'adds a tag to the category' do
			category.tag_names = 'yolo'
			expect(category.tags.length).to eq 1
		end
	end

	describe 'two tags that do not exist' do
		it 'adds a tag to the category' do
			category.tag_names = 'yolo, swag'
			expect(category.tags.length).to eq 2
		end
	end

	describe 'tag already exists' do
	
		let!(:existing_tag){Tag.create(name: 'yolo')}
	
		it 'reuses the existing tag' do
			category.tag_names = 'yolo'
			expect{ category.save! }.not_to raise_error
			expect(category.tags).to include existing_tag
			expect(Tag.count).to eq 1
		end
	end
end
