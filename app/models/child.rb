class Child < ApplicationRecord
  # Relationships
  has_many :chores
  has_many :tasks, through: :chores

  # Validations
  validates_presence_of :first_name
  validates_presence_of :last_name

  # Methods
  def name
    first_name + " " + last_name
  end

  def points_earned
    self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
  end 
  # Scopes
  scope :active,       -> { where(active: true) }
  scope :alphabetical, -> { order('first_name, last_name') } 
end
