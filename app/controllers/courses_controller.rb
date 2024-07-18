class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses
  # Retrieves all courses from the database
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # Shows details of a specific course
  def show
  end

  # GET /courses/new
  # Initializes a new Course object for the form
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  # Prepares the form for editing an existing course
  def edit
  end

  # POST /courses
  # Creates a new course record
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_url, notice: 'Course was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  # Updates an existing course record
  def update
    if @course.update(course_params)
      redirect_to courses_url, notice: 'Course was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  # Removes a course record from the database
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private
    # Finds a specific course by ID
    def set_course
      @course = Course.find(params[:id])
    end

    # Defines allowed parameters for course creation and updates
    def course_params
      params.require(:course).permit(:title, :description)
    end
end
