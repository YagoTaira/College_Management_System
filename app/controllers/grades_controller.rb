class GradesController < ApplicationController
  before_action :set_grade, only: %i[show edit update destroy]

  def index
    @grades = Grade.all
  end

  def show
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grades_url, notice: 'Grade was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      redirect_to grades_url, notice: 'Grade was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @grade.destroy
    redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end

  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:enrollment_id, :score)
  end
end