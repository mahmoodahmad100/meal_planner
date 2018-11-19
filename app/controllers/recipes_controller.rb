class RecipesController < ApplicationController
  before_action :require_login

  def index
    @recipes = current_user.recipes.order(:id)
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "you created new recipe!"
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe), notice: "you updated the recipe!"
    else
      @errors = @recipe.errors.full_messages
      render :edit
    end
  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "you deleted #{recipe.name} recipe!"
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

end