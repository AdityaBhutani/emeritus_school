class ClassmatesController < ApplicationController

  # GET /classmates or /classmates.json
  def index
    @student = current_user
    @classmates = @student.classmates
  end
end
