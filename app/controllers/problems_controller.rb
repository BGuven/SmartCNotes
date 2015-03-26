class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :update, :destroy]

  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.all

    render json: @problems
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    # fetch sub problems and put it in json
    cause = []
    @problem.problem_references.each do |problem_reference|
      cause << problem_reference.sub_problem
    end
    @problem_attributes  = @problem.attributes.merge(cause: cause)
    render json: @problem_attributes
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(problem_params)

    if @problem.save
      render json: @problem, status: :created, location: @problem
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    @problem = Problem.find(params[:id])

    if @problem.update(problem_params)
      head :no_content
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy

    head :no_content
  end

  private

    def set_problem
      @problem = Problem.find(params[:id])
    end

    def problem_params
      params.require(:problem).permit(:name, :dx, :tx, :cause_desc, :prognosis)
    end
end
