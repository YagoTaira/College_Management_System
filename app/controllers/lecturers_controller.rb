class LecturersController < ApplicationController
  before_action :set_lecturer, only: %i[ show edit update destroy ]

  # GET /lecturers
  # Retrieves all lecturers from the database
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1
  # Shows details of a specific lecturer
  def show
  end

  # GET /lecturers/new
  # Initializes a new Lecturer object for the form
  def new
    @lecturer = Lecturer.new
  end

  # GET /lecturers/1/edit
  # Prepares the form for editing an existing lecturer
  def edit
  end

  # POST /lecturers
  # Creates a new lecturer record
  def create
    @lecturer = Lecturer.new(lecturer_params)

    if @lecturer.save
      redirect_to lecturers_url, notice: 'Lecturer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lecturers/1
  # Updates an existing lecturer record
  def update
    if @lecturer.update(lecturer_params)
      redirect_to lecturers_url, notice: 'Lecturer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lecturers/1
  # Removes a lecturer record from the database
  def destroy
    @lecturer.destroy
    redirect_to lecturers_url, notice: 'Lecturer was successfully destroyed.'
  end

  private
    # Finds a specific lecturer by ID
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    # Defines allowed parameters for lecturer creation and updates
    def lecturer_params
      params.require(:lecturer).permit(:name, :age, :email)
    end
end
