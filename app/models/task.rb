class Task < ApplicationRecord
  has_rich_text :description

  validates :title, :due_date, presence: true
  validates_inclusion_of :status, in: [true, false]
  validates :title, length: {minimum: 3}
  validates :description, length: {maximum: 250}

  scope :completed, -> { where(status: true) }
  scope :incomplete, -> { where(status: false) }
  default_scope { order(created_at: :desc) }

  def completed?
    status == true
  end

  def incomplete?
    status == false
  end

  def has_description?
    description.present?
  end
end
