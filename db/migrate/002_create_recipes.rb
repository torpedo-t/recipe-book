class CreateRecipes < ActiveRecord::Migration[5.2]
    def change
        create_table :recipes do |t|
            t.string :name
            t.belongs_to :user, foreign_key: true
        end
    end
end