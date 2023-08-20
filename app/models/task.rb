class Task < ApplicationRecord
    belongs_to :user
    validates_presence_of :title, :description, :due_date, :priority, :category
end
