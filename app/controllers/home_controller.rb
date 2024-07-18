class HomeController < ApplicationController
  # GET /
  # Retrieves all grades for display on the home page
  def index
    @grades = Grade.all
  end
end
