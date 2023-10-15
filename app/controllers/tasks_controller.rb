class TasksController < ApplicationController
require "csv"

before_action :set_task, except: [:index, :new, :create, :export_csv]

def index
  fetch_possibly_filtered_tasks
end

def show

end

def new
  @task = Task.new
end


def create
  @task = Task.create(task_params)
  respond_to do |format|
    if @task.persisted?
      format.html { redirect_to @task, notice: "Task successfully created!" }
      format.json { render json: @task.as_json(only: [:title, :due_date, :status]), status: :created }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity }
    end
  end
end

def edit

end

def update
  if @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to @task, notice: "Task successfully updated!" }
      format.json { render json: @task.as_json(only: [:title, :due_date, :status]), status: :ok }
    end
  else
    respond_to do |format|
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity }
    end
  end
end


def destroy
  @task.destroy
  redirect_to tasks_url, notice: "Task deleted"
end

def mark_task_as_done
  @task.update(status: true)
  redirect_to @task
end

def export_csv
  fetch_possibly_filtered_tasks

  if @tasks.present?
    respond_to do |format|
      format.csv do
        send_data generate_csv(@tasks), filename: "tasks.csv"
      end
    end
  else
    redirect_to tasks_url, notice: "No tasks to export"
  end
end

private

def generate_csv(tasks)
  CSV.generate(headers: true) do |csv|
    csv << ["Title", "Date Created", "Status"]

    @tasks.each do |task|
      csv << [
        task.title,
        formatted_date(task.created_at),
        task.status ? 'completed' : 'incomplete',
      ]
    end
  end
end

  def fetch_possibly_filtered_tasks
    if params[:status] == 'completed'
      @tasks = Task.completed
    elsif params[:status] == 'incomplete'
      @tasks = Task.incomplete
    else
      @tasks = Task.all # With a lot of tasks in a production app, we would use pagination here
    end
  end

  def formatted_date(time)
    time.strftime("%Y-%m-%d")
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :status)
  end

end