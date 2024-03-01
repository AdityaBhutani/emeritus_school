class ClassmatesController < ApplicationController

  # GET /classmates or /classmates.json
  def index
    authorize :classmate

    @student = current_user
    @classmates = @student.classmates

    respond_to do |format|
      format.html
      format.json
    end
  end
end
