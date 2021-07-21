class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ratings
    has_many :users, through: :ratings
    has_many :ingredients, dependent: :destroy
    has_many :recipe_categories
    has_many :categories, through: :recipe_categories
    accepts_nested_attributes_for :ingredients, :categories
    validates_presence_of :ingredients, :categories
    validates_associated :ingredients, :categories
    validates :name, presence: true
    scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }

    def categories_attributes=(attributes)
        attributes.values.each do |attribute|
            category = Category.find_by(attribute)
            self.categories << category
        end
    end
end