class CreateRecipeCategories < ActiveRecord::Migration[5.2]
    def change
        create_table :recipe_categories do |t|
            t.belongs_to :category, foreign_key: true
            t.belongs_to :recipe, foreign_key: true
        end
    end
end