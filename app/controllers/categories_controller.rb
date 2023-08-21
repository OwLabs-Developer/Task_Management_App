class CategoriesController < ApplicationController
    before_action :set_category, only:[:show, :edit, :update, :destroy]

    # Display the category
    def show 
        @category_tasks = @category.tasks
    end

     # Create the category instance that user input from form
    def new
        @category = Category.new
    end

    # Handle category creation and save to database
    def create 
        @category = Category.new(category_params)
        if @category.save
            redirect_to root_path, success: "New category added!"
        else
            render :new
        end
    end

    # Retrieve category data for user edit
    def edit 
    end

    # Reupdate latest category details from user
    def update  
        if @category.update(category_params)
            redirect_to root_path, success: "Categories has been updated!"
        else
            render :edit
        end
    end

    # Delete category data
    def destroy 
        @category.destroy
        redirect_to root_path, info: "Current category has been deleted!"
    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
    end

    def set_category
        @category = Category.find(params[:id])
    end

end
