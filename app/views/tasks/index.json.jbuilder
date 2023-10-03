json.array! @tasks do |task|
  json.extract! task, :title, :due_date, :status
end