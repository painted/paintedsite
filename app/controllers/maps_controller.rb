class MapsController < ApplicationController

	def show
		@category = Category.find_by_title params[:category_id]
	end

end
