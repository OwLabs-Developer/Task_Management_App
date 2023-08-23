class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  

  def index
    @q = Task.joins(:category).ransack(params[:q])
    
    if params[:q] && !params[:q][:title_or_category_name_cont].present?
      title_or_category_name = params[:q][:title_or_category_name_cont]
      @q.result.where('tasks.title LIKE ? OR categories.name LIKE ?', "%#{title_or_category_name}%", "%#{title_or_category_name}%")
    end
    
    @tasks = @q.result.includes(:category)
  end




  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, success: "New task has been created successfully!"
    else
      puts @task.errors.full_messages # Add this line for debugging
      redirect_to new_task_path, warning: "Please fill in all the details!"
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, success: "Task has been successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, info: "Task was successfully deleted"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority, :status, :category_id, :category_name)
  end

  def find_task
    @task = current_user.tasks.find(params[:id])
  end
end
