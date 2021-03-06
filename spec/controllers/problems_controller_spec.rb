require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ProblemsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Problem. As you add validations to Problem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: 'test',
      dx: 'dx test 1',
      tx: 'tx test 1',
      cause_desc: 'cause_desc test 1',
      prognosis: 'prognosis test 1'
    }
  }

  let(:valid_attributes_causes) {
    {
      name: 'test cause',
      dx: 'dx subprobem test',
      tx: 'tx subprobem test'
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProblemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all problems as @problems" do
      problem = Problem.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:problems)).to eq([problem])
    end
  end

  describe "GET show" do
    it "assigns the requested problem as @problem" do
      problem = Problem.create! valid_attributes
      get :show, {:id => problem.to_param}
      expect(assigns(:problem)).to eq(problem)
    end

    it "appends the subproblems in a new field called cause if subproblems present" do
      problem = Problem.create! valid_attributes
      cause = Problem.create! valid_attributes_causes
      problem.problem_references.build(:sub_problem_id => cause.id)
      problem.save!
      get :show, {:id => problem.to_param}
      expect(assigns(:problem_attributes)[:cause]).to eq([cause])
    end
  end

  # describe "GET new" do
  #   it "assigns a new problem as @problem" do
  #     get :new, {}, valid_session
  #     expect(assigns(:problem)).to be_a_new(Problem)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested problem as @problem" do
  #     problem = Problem.create! valid_attributes
  #     get :edit, {:id => problem.to_param}, valid_session
  #     expect(assigns(:problem)).to eq(problem)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Problem" do
  #       expect {
  #         post :create, {:problem => valid_attributes}, valid_session
  #       }.to change(Problem, :count).by(1)
  #     end

  #     it "assigns a newly created problem as @problem" do
  #       post :create, {:problem => valid_attributes}, valid_session
  #       expect(assigns(:problem)).to be_a(Problem)
  #       expect(assigns(:problem)).to be_persisted
  #     end

  #     it "redirects to the created problem" do
  #       post :create, {:problem => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Problem.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved problem as @problem" do
  #       post :create, {:problem => invalid_attributes}, valid_session
  #       expect(assigns(:problem)).to be_a_new(Problem)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:problem => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested problem" do
  #       problem = Problem.create! valid_attributes
  #       put :update, {:id => problem.to_param, :problem => new_attributes}, valid_session
  #       problem.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested problem as @problem" do
  #       problem = Problem.create! valid_attributes
  #       put :update, {:id => problem.to_param, :problem => valid_attributes}, valid_session
  #       expect(assigns(:problem)).to eq(problem)
  #     end

  #     it "redirects to the problem" do
  #       problem = Problem.create! valid_attributes
  #       put :update, {:id => problem.to_param, :problem => valid_attributes}, valid_session
  #       expect(response).to redirect_to(problem)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the problem as @problem" do
  #       problem = Problem.create! valid_attributes
  #       put :update, {:id => problem.to_param, :problem => invalid_attributes}, valid_session
  #       expect(assigns(:problem)).to eq(problem)
  #     end

  #     it "re-renders the 'edit' template" do
  #       problem = Problem.create! valid_attributes
  #       put :update, {:id => problem.to_param, :problem => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested problem" do
  #     problem = Problem.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => problem.to_param}, valid_session
  #     }.to change(Problem, :count).by(-1)
  #   end

  #   it "redirects to the problems list" do
  #     problem = Problem.create! valid_attributes
  #     delete :destroy, {:id => problem.to_param}, valid_session
  #     expect(response).to redirect_to(problems_url)
  #   end
  # end

end
