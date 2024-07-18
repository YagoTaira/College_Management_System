class GradesController < ApplicationController
  before_action :set_grade, only: %i[show edit update destroy]

  # GET /grades
  # Retrieves all grades from the database
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  # Shows details of a specific grade
  def show
  end

  # GET /grades/new
  # Initializes a new Grade object for the form
  def new
    @grade = Grade.new
  end

  # POST /grades
  # Creates a new grade record
  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grades_url, notice: 'Grade was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /grades/1/edit
  # Prepares the form for editing an existing grade
  def edit
  end

  # PATCH/PUT /grades/1
  # Updates an existing grade record
  def update
    if @grade.update(grade_params)
      redirect_to grades_url, notice: 'Grade was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /grades/1
  # Removes a grade record from the database
  def destroy
    @grade.destroy
    redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end

  private

  # Finds a specific grade by ID
  def set_grade
    @grade = Grade.find(params[:id])
  end

  # Defines allowed parameters for grade creation and updates
  def grade_params
    params.require(:grade).permit(:enrollment_id, :score)
  end
end
