class Task < ApplicationRecord
  validates :title, :due_date, presence: true
  validates_inclusion_of :status, in: [true, false]
  validates :title, length: {minimum: 3}
end
