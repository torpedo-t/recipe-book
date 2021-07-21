class RecipesController < ApplicationController
    before_action :get_user, only: [:new, :create]
    before_action :current_user, only: [:index, :show, :most_recent]
    before_action :set_recipe, only: [:show]

    def new
        @recipe = Recipe.new
        @recipe.ingredients.build 
        @recipe.ingredients.build
        @recipe.ingredients.build
        @recipe.ingredients.build
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe[:user_id] = @user.id
        if @recipe.save
            # byebug
            redirect_to user_recipes_path(@user)
        else
            # byebug
            render "recipes/new"
        end
    end

    def index
        if params[:user_id] && user = User.find_by(id: params[:user_id])
            # byebug
            # @recipes = User.find_by(id: params[:id]).recipes
            @recipes = user.recipes
        elsif params[:category_id] && @category = Category.find_by(id: params[:category_id])
            @recipes = @category.recipes
        else
            # byebug
        @recipes = Recipe.all
        # byebug
        end
    end

    def show 
        # byebug
        if params[:category_id] && @category = Category.find_by(id: params[:category_id])
            @category
        end
        @rating = Rating.new
    end

    def most_recent
        @recent_recipes = Recipe.most_recent(3)
        # byebug
        render "recipes/most_recent"
    end

    # def edit

    # end

    # def update

    # end

    # def destroy

    # end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :category, :user_id, ingredients_attributes: [:name, :calories], category_ids: [])
    end

    def set_recipe #method to associate an instance variable with the recipe the user has chosen to view
        @recipe = Recipe.find_by(id: params[:id])
    end

    def get_user
        @user = User.find_by(id: params[:user_id])
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end
end