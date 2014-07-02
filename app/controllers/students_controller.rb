class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    
    render layout: false
  end

  def create
    @student = Student.new(student_params)
    
    if @student.save
      @student.addresses << Address.new
      redirect_to students_path
    else
      redirect_to action: nil
    end
  end

  def edit
    @student = Student.find(params[:id])
    
    render layout: false
  end

  def update
    @student = Student.find(params[:id])
    
    if @student.update(student_params)
      redirect_to students_path
    else
      redirect_to action: nil
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
  
  def breadcrumbs
    if action_name != 'index'
      @breadcrumbs = "<li><a href='/'>Home</a></li><li><a href='/students'>Students</a></li><li class='active'>#{action_name}</li>".html_safe
    else
      @breadcrumbs = "<li><a href='/'>Home</a></li><li class='active'>Students</li>".html_safe
    end
  end

  private

    def student_params
      params.required(:student).permit(:email,
        :first_name,
        :last_name,
        addresses_attributes: [:country, :city, :street, :number, :zipcode]
      )
    end

end
