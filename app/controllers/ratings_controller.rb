class RatingsController < ApplicationController

    def new
        @rating = Rating.new
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @rating = Rating.new(rating_params)
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @rating[:recipe_id] = @recipe.id
        @rating[:user_id] = @user.id
        @rating[:score] = params[:rating][:score]
        # byebug
        if @rating.save
            # byebug
            redirect_to user_recipe_path(@rating.user_id, @recipe)
        else
            # byebug
            render "recipes/show"
            # redirect_to user_recipe_path(@rating.recipe_id, )
        end
    end

    private

    def rating_params
        params.require(:rating).permit(:score)
    end
end