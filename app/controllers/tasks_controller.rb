class TasksController < ApplicationController

  def index
    @tasks = Task.pluck(:id, :title, :due_date, :status)
    if @tasks.empty?
      render json: {message: "No tasks found"}, status: 404
    else
      @tasks_hash = @tasks.map do |id, title, due_date, status|
        {id: id, title: title, due_date: due_date, status: status}
      end
      render json: {tasks: @tasks_hash}, status: 200
    end
  end

  def create
    @task = Task.create(title:params[:title], due_date: params[:due_date], status: params[:status] )
    if @task.persisted?
      render json: {message: "Task created successfully", task: {title: @task.title, due_date: @task.due_date, status: @task.status}}, status: 201
    else
      render json: {message: "Unable to create task", errors: @task.errors.full_messages}, status: 422
    end
  end

  def update
    @task = Task.find(params[:id])
    update_params = {title: params[:title], due_date: params[:due_date], status: params[:status]}
    if @task.update(update_params)
      render json: {message: "Task updated successfully", task: {title: @task.title, due_date: @task.due_date, status: @task.status}}, status: 201
    else
      render json: {message: "Unable to update task", errors: @task.errors.full_messages}, status: 422
    end
  end
end
