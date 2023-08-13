class CategoriesController < ApplicationController
    before_action :set_category, only:[:show, :edit, :update, :destroy]

    def show ## Display the category
        @categories = category.all
    end

    def new ## Create the category instance that user input from form
        @category = category.new
    end

    def create ## Handle category creation and save to database
        @category.new = category.find(category_params)
        if @category.save
            redirect_to root_path, notice: "New category added"
        else
            render :new
        end
    end

    def edit ## Retrieve category data for user edit
    end

    def update ## Reupdate latest category details from user 
        if @category.update = category.find(category_params)
            redirect_to root_path, notice: "Categories has been updated"
        else
            render :edit
        end
    end

    def destroy ## Delete category data
        @category.destroy
        redirect_to root_path, notice: "Current category has been DELETED"
    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
    end

    def set_category
        @category = Category.find(params[:id])
    end

end
