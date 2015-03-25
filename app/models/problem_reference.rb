class ProblemReference < ActiveRecord::Base
  belongs_to :problem
  belongs_to :sub_problem, :class_name => 'Problem'
end
