module TasksHelper
  def format_due_date(task)
    task.due_date.strftime("%m/%d/%Y")
  end
end
