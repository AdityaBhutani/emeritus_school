# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

PASSWORD = 'asdqwezxc'

school_admin = SchoolAdmin.new(first_name: 'School', last_name: 'Admin1', email: 'school@admin.com', password: PASSWORD)
school_admin.save!

admin = Admin.new(first_name: 'Admin', last_name: 'Admin1', email: 'admin@admin.com', password: PASSWORD)
admin.save!

school = School.new(name: 'School 1', address: 'Delhi', school_admin: school_admin)
school.save!

course = Course.new(name: 'Course 1', school: school)
course.save!

batch = Batch.new(name: 'Batch1', start_date: 10.months.ago, end_date: 2.years.from_now, course: course)
batch.save!

student = Student.new(first_name: 'Student1', last_name: 'student1', email: 'stu@dent1', password: PASSWORD)
student.save!

student2 = Student.new(first_name: "Student2", last_name: "student2", email: "stu@dent2", password: "asdqwezxc")
student2.save!

enrollment = Enrollment.new(student: student, batch: batch)
enrollment.save!

enrollment2 = Enrollment.new(student: student2, batch: batch)
enrollment2.save!