class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show edit update destroy]
  
  # GET /attendances
  # Retrieves all attendance records
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # Shows details of a specific attendance record
  def show
  end

  # GET /attendances/new
  # Initializes a new Attendance object for the form
  def new
    @attendance = Attendance.new
  end

  # POST /attendances
  # Creates a new attendance record
  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to attendances_url, notice: 'Attendance was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /attendances/1/edit
  # Prepares the form for editing an existing attendance record
  def edit
  end

  # PATCH/PUT /attendances/1
  # Updates an existing attendance record
  def update
    if @attendance.update(attendance_params)
      redirect_to attendances_url, notice: 'Attendance was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /attendances/1
  # Removes an attendance record from the database
  def destroy
    @attendance.destroy
    redirect_to attendances_url, notice: 'Attendance was sucessfully destroyed.'
  end

  private

  # Finds a specific attendance record by ID
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Defines allowed parameters for attendance creation and updates
  def attendance_params
    params.require(:attendance).permit(:enrollment_id, :status, :date)
  end
end
