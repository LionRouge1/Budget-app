class CategoriesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @categories = current_user.groups
  end

  def new
    @category = Group.new
  end

  def show
    @category = Group.find(params[:id])
    @entities = @category.entities.where(user: current_user).order(created_at: :desc)
  end

  def create
    category = current_user.groups.new(category_params)
    if category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      render :new, alert: category.errors.first
    end
  end

  private

  def category_params
    params.require(:group).permit(:name, :icon)
  end
end
