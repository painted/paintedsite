class AddAddressToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :address, :text
  end
end
