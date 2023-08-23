class CategoriesController < ApplicationController
    before_action :set_category, only:[:show, :edit, :update, :destroy]

    # Display the category
    def show 
        @category_tasks = @category.tasks
    end

     # Create the category instance that user input from form
    def new
        @category = Category.new
        @collection = Category.all
    end

    # Handle category creation and save to database
    def create
        @category = Category.new(category_params)
        
        if @category.save
          # Fetch the task that needs to be updated
          task_to_update = Task.find(params[:category][:task_id])
          
          # Update the task's category_id to match the newly created category's id
          task_to_update.update(category_id: @category.id)
          redirect_to root_path, success: "Categories has been added!"
          
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
        params.require(:category).permit( :task_id, :name, :category_id)
    end

    def set_category
        @category = Category.find(params[:id])
    end

end
