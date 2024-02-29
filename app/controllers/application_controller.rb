# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     admin_dashboard_path
  #   when SchoolAdmin
  #     school_admin_dashboard_path
  #   when Student
  #     student_dashboard_path
  #   else
  #     root_path
  #   end
  # end
end
