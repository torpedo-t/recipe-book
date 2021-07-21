class CreateRatings < ActiveRecord::Migration[5.2]
    def change
        create_table :ratings do |t|
            t.integer :score
            t.belongs_to :recipe, foreign_key: true
            t.belongs_to :user, foreign_key: true
        end
    end
end