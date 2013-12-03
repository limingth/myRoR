class WelcomeController < ApplicationController
  def index
    @students = Student.order(updated_at: :desc).limit(25)
    @student = Student.new
  end
end
