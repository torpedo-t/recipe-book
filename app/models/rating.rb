class Rating < ApplicationRecord
    belongs_to :recipe
    belongs_to :user
    validates :score, presence: true
    validates :score, numericality: { only_integer: true }
    validates :score, numericality: { greater_than_or_equal_to: 1 }
    validates :score, numericality: { less_than_or_equal_to: 5 }
end