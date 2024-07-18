class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[show edit update destroy]

  # GET /enrollments
  # Retrieves all enrollments from the database
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # Shows details of a specific enrollment
  def show
  end

  # GET /enrollments/new
  # Initializes a new Enrollment object and loads related data for the form
  def new
    @enrollment = Enrollment.new
    @students = Student.all
    @courses = Course.all
    @lecturers = Lecturer.all
  end

  # POST /enrollments
  # Creates a new enrollment record
  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      redirect_to enrollments_url, notice: 'Enrollment was successfully created.'
    else
      @students = Student.all
      @courses = Course.all
      @lecturers = Lecturer.all
      render :new, status: :unprocessable_entity
    end
  end

  # GET /enrollments/1/edit
  # Prepares the form for editing an existing enrollment and loads related data
  def edit
    @students = Student.all
    @courses = Course.all
    @lecturers = Lecturer.all
  end

  # PATCH/PUT /enrollments/1
  # Updates an existing enrollment record
  def update
    if @enrollment.update(enrollment_params)
      redirect_to enrollments_url, notice: 'Enrollment was successfully updated.'
    else
      @students = Student.all
      @courses = Course.all
      @lecturers = Lecturer.all
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /enrollments/1
  # Removes an enrollment record from the database
  def destroy
    @enrollment.destroy
    redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.'
  end

  private

  # Finds a specific enrollment by ID
  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  # Defines allowed parameters for enrollment creation and updates
  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id, :lecturer_id)
  end
end
