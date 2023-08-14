class TasksController < ApplicationController
   before_action :set_task, only:[:show, :edit, :update, :destroy]

    def index  # To display all list task in main page
        @tasks = Task.all
    end

    def show # To display current task
        @task = Task.find(params[:id])
    end

    def new # Create new TASK instance for user input 
        @task = Task.new
    end

    def create # To handle task creation process and save to database
        @task = Task.new(task_params)
        if @task.save
            redirect_to root_path, notice: "New task has been created successfully"
        else 
            render :new
    
    def edit # Retrieve current task data for reupdate.
    end

    def update # Reupdate task edit by user
       if @task = Task.update(task_params)
        redirect_to root_path, notice: "Task has succesfully updated"
        else
            render :edit
        end
    end

    def destroy # To delete task
        @task = Task.destroy
        redirect_to root_path, notice: "Current task DELETED"
    end
    
    private
    def task_params
        params.require(:task).permit(:title, :description, :due_date)
    end

    def set_task
        @task = Task.find(params[:id])
    end
    
end
