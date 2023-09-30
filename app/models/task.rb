class Task < ApplicationRecord
  validates :title, :due_date, :status, presence: true
  validates :title, length: {minimum: 3}
end
