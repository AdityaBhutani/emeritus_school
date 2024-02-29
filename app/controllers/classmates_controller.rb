class ClassmatesController < ApplicationController

  # GET /classmates or /classmates.json
  def index
    @student = current_user
    @classmates = @student.classmates
  end

  private
    # Only allow a list of trusted parameters through.
    def classmate_params
      params.fetch(:classmate, {})
    end
end
