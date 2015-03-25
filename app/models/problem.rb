class Problem < ActiveRecord::Base
  has_many :problem_references
  has_many :sub_problems, :through => :problem_references
end
