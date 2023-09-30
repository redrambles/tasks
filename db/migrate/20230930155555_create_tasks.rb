class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :due_date
      t.boolean :status

      t.timestamps
    end
  end
end
