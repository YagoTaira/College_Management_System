class HomeController < ApplicationController
  def index
    @grades = Grade.all
  end
end
