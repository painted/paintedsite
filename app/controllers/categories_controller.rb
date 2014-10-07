class CategoriesController < ApplicationController

	before_action :authenticate_admin!, except: [:index]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find_by_title params[:id]
	end

	def create
		@category = Category.new(params[:category].permit(:title, :description, :image, :url, :tag_names))
		@category.save!
		redirect_to categories_path
		rescue ActiveRecord::RecordInvalid
			flash[:notice] = 'You must add an image'
		redirect_to new_category_path
	end 
end
