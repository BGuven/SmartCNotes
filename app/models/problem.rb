class Problem < ActiveRecord::Base
  has_many :problem_references
  has_many :sub_problems, :through => :problem_references
  # after_initialize :get_causes

  # private
  # def get_causes
  #   cause = []
  #   self.problem_references.each do |problem_reference|
  #     cause << problem_reference.sub_problem
  #   end
  #   self.cause ||= cause
  # end
end
