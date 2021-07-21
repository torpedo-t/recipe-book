class Ingredient < ApplicationRecord
    belongs_to :recipe
    validates :name, presence: true
    validates :calories, presence: true
end