class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students
  # Retrieves all students from the database
  def index
    @students = Student.all
  end

  # GET /students/1
  # Shows details of a specific student
  def show
  end

  # GET /students/new
  # Initializes a new Student object for the form
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  # Prepares the form for editing an existing student
  def edit
  end

  # POST /students
  # Creates a new student record
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_url, notice: 'Student was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  # Updates an existing student record
  def update
    if @student.update(student_params)
      redirect_to students_url, notice: 'Student was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # Removes a student record from the database
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
    # Finds a specific student by ID
    def set_student
      @student = Student.find(params[:id])
    end

    # Defines allowed parameters for student creation and updates
    def student_params
      params.require(:student).permit(:name, :age, :email)
    end
end
