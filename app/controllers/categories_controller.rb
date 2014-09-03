class CategoriesController < ApplicationController

	before_action :authenticate_admin!, except: [:index]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category].permit(:title, :description, :image))
		@category.save!
		redirect_to categories_path
	end 
end
