class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    has_many :ratings
    has_many :rated_recipes, through: :ratings, source: :recipe
    validates :email, presence: true
    validates :password_digest, presence: true
end