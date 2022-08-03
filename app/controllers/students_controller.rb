class StudentsController < ApplicationController

  def index
    @students = Student.all.order("created_at DESC")
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new # Needed to instantiate the form_for
  end

  def edit
    @student = Student.find(params[:id])
  end



    def update
      @student = Student.find(params[:id])
      @student.update(student_params)
      redirect_to student_path(@student)
    end

    def create
      @student = Student.new(student_params)
      if
        @student.save
        redirect_to student_path(@student)
      else
        redirect_to new_student_path
      end

    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
    #no need for app/views/restaurants/destroy.html.erb
       redirect_to students_path
     end

    private

     def student_params
       params.require(:student).permit(:first_name, :last_name,:contact_email,:contact_phone, :date_of_birth, :school, :is_converted, :channel, :photo)
     end

end
