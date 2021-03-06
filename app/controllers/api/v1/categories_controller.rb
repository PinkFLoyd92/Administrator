class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all

    render json: @categories
  end

  def show
    render json: @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save    
      render json: @category, status: :created, location: api_v1_category_url(@category)   
    else    
      render json: @category.errors, status: :unprocessable_entity   
    end
  end

  def update   
    if @category.update(category_params)    
      render json: @category   
    else    
      render json: @category.errors, status: :unprocessable_entity   
    end  
  end

  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
