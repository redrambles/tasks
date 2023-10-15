class AddDescriptionToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :description, :text
  end
end
