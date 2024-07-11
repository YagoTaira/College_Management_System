class LecturersController < ApplicationController
  before_action :set_lecturer, only: %i[ show edit update destroy ]

  def index
    @lecturers = Lecturer.all
  end

  def show
  end

  def new
    @lecturer = Lecturer.new
  end

  def edit
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)

    if @lecturer.save
      redirect_to lecturers_url, notice: 'Lecturer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @lecturer.update(lecturer_params)
      redirect_to lecturers_url, notice: 'Lecturer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lecturer.destroy
    redirect_to lecturers_url, notice: 'Lecturer was successfully destroyed.'
  end

  private
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    def lecturer_params
      params.require(:lecturer).permit(:name, :age, :email)
    end
end
