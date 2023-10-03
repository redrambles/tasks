class TasksController < ApplicationController

  # def index
  #   ### Try the jbuilder template option
  #   @tasks = Task.pluck(:id, :title, :due_date, :status)

  #   # Rails can figure out which template to use based on the request - if you have separate templates
  #   # In views folder have templates for HTML / XML / JSON and Rails will choose the right one (based on the Content-Type: application/json)

  #   # Return a 404 only for a single resource - if the path does not resolve to anything (as opposed to an empty list)
  #   # Return a consistent thing from the API - if you are getting an array with objects, then return that or an empty array
  #   @tasks_hash = @tasks.map do |id, title, due_date, status|
  #     {id: id, title: title, due_date: due_date, status: status}
  #   end
  #   render json: {tasks: @tasks_hash}, status: 200
  # end

  # def create
  #   @task = Task.create(title: params[:title], due_date: params[:due_date], status: params[:status] )
  #   if @task.persisted?
  #     render json: {task: {id: @task.id, title: @task.title, due_date: @task.due_date, status: @task.status}}, status: 201
  #   else
  #     render json: {errors: @task.errors.full_messages}, status: 422
  #   end
  # end

  # def update
  #   @task = Task.find(params[:id])
  #   update_params = {title: params[:title], due_date: params[:due_date], status: params[:status]}
  #   if @task.update(update_params)
  #     render json: {task: {id: @task.id, title: @task.title, due_date: @task.due_date, status: @task.status}}, status: 201
  #   else
  #     render json: {errors: @task.errors.full_messages}, status: 422
  #   end
  # end

before_action :set_task, only: [:show, :edit, :update, :delete]

def index
  if params[:status] == 'completed'
    @tasks = Task.completed
  elsif params[:status] == 'incomplete'
    @tasks = Task.incomplete
  else 
    @tasks = Task.all # With a lot of tasks in a production app, we would use pagination here
  end
end

def show

end

def new
  @task = Task.new
end


def create
  @task = Task.create(task_params)
  if @task.persisted?
    redirect_to @task, notice: "Task successfully created!"
  else
    render :new, status: :unprocessable_entity
  end
end

def edit

end

def update
  if @task.update(task_params)
    redirect_to @task, notice: "Task updated!"
  else
    render :edit, status: :unprocessable_entity
  end
end


def destroy
  @task.destroy
  redirect_to tasks_url, notice: "Task deleted"
end

def toggle_status_state
  @task = Task.find(params[:id])
  @task.update(status: true)
  redirect_to @task
end

private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :status)
  end




























end








































