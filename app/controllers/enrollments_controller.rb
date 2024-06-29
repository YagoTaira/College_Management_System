class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[show edit update destroy]

  def index
    @enrollments = Enrollment.all
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
    @students = Student.all
    @courses = Course.all
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      redirect_to enrollments_url, notice: 'Enrollment was successfully created.'
    else
      @students = Student.all
      @courses = Course.all
      render :new
    end
  end

  def edit
    @students = Student.all
    @courses = Course.all
  end

  def update
    if @enrollment.update(enrollment_params)
      redirect_to enrollments_url, notice: 'Enrollment was successfully updated.'
    else
      @students = Student.all
      @courses = Course.all
      render :edit
    end
  end

  def destroy
    @enrollment.destroy
    redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.'
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end
end