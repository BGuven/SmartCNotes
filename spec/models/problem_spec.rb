require 'rails_helper'

RSpec.describe Problem, :type => :model do
  it "creates a new Problem" do 
    problem = Problem.new()
    expect(problem).to be_a Problem
  end

  it "creates a Problem with attributes" do
    problem_hash = {name:'Diarrhea', dx:'diagnosis test' , tx:'treatment test', cause_desc:'description test', prognosis:'prognosis_test'}
    problem = Problem.create!(problem_hash)
    expect(problem.name).to eq(problem_hash[:name])
    expect(problem.dx).to eq(problem_hash[:dx])
    expect(problem.tx).to eq(problem_hash[:tx])
    expect(problem.cause_desc).to eq(problem_hash[:cause_desc])
    expect(problem.prognosis).to eq(problem_hash[:prognosis])
  end

  it "creates a Problem with SubProblems" do
    problem_hash_1 = {name:'Diarrhea', dx:'diagnosis test' , tx:'treatment test', cause_desc:'description test', prognosis:'prognosis_test'}
    problem_hash_2 = {name:'Fever Nyd', dx:'fever test' , tx:'treatment test', cause_desc:'description test', prognosis:'prognosis_test'}

    problem1 = Problem.create!(problem_hash_1)
    problem2 = Problem.create!(problem_hash_2)

    problem1.problem_references.build(:sub_problem_id => problem2.id) 

    expect(problem1.problem_references.first.sub_problem.name).to eq(problem_hash_2[:name])
  end
end