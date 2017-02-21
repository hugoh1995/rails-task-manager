class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy, :update]
  def _form

  end

  def edit
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def show
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    # *Strong params*: You need to *whitelist* what
    # can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:name, :description)
  end
end
