class StudentsController < ApplicationController

  def index
    @students = Student.order(updated_at: :desc).limit(25)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def destroy
    a = Student.find(params[:id])
    if a.destroy
      redirect_to "/students"
    end
  end

private
  def student_params
    params.require(:student).permit(:name, :email, :major)
  end

end

