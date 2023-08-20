class TasksController < ApplicationController
   before_action :find_task, only:[:show, :edit, :update, :destroy]

   # To display all list task in main page
    def index  
        @tasks = current_user.tasks
    end

    # To display current task
    def show 
        @task = current_user.tasks.find(params[:id])
    end

    # Create new TASK instance for user input 
    def new 
        @task = Task.new
    end

     # To handle task creation process and save to database
    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to tasks_path, success: "New task has been created successfully!"
        else 
            redirect_to new_task_path, warning: "Please key in all of the details!"
        end
    end
    
    # Retrieve current task data for reupdate.
    def edit
        @task = current_user.tasks.find(params[:id]) 
    end

    def update # Reupdate task edit by user
       if @task = Task.update(task_params)
        redirect_to tasks_path, success: "Task has been succesfully updated!"
        else
            render :edit
        end
    end

    # To delete task
    def destroy 
        @task.destroy
        redirect_to tasks_path, info: "Task was successfully deleted"
    end
    
    private

    def task_params
        params.require(:task).permit(:title, :description, :due_date, :priority, :status, :category)
    end

    def find_task
        @task = current_user.tasks.find(params[:id])
    end
    
end
