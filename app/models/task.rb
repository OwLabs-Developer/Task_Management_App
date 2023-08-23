class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  validates_presence_of :title, :description, :due_date, :priority

  
 # Define ransackable associations
 def self.ransackable_associations(auth_object = nil)
  [] # Leave it empty or specify associations you want to allow for searching
end

# Define ransackable attributes including the custom category_name
def self.ransackable_attributes(auth_object = nil)
  %w[title category_name] # Add other attributes you want to search here
end

# Define a custom ransacker for searching by category name
ransacker :category_name, formatter: proc { |v| v.downcase } do
  Arel.sql("LOWER(categories.name)")
end
end