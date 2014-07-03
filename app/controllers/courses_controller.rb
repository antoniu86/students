class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @student = Student.find(params[:student_id])
  end

  def new
    @student = Student.find(params[:student_id])
    @courses = Course.all
    @student_course = StudentsCourse.new
    @student_course.student = @student
    
    render layout: false
  end

  def create
    @student_course = StudentsCourse.new(student_course_params)
    @student_course.student_id = params[:student_id]
    @student_course.save!
    redirect_to students_path
  end

  private

    def student_course_params
      params.required(:student_course).permit(:course_id)
    end

end
