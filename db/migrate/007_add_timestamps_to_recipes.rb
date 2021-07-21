class AddTimestampsToRecipes < ActiveRecord::Migration[5.2]
    def change
        add_column :recipes, :created_at, :datetime, null: false
        add_column :recipes, :updated_at, :datetime, null: false
    end
end