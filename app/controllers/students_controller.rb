class StudentsController < ApplicationController

  def index
    if params[:query].present?
      @students = Student.search_student(params[:query])
    else
      @students = Student.all.order("created_at DESC")
    end
  end

  def paid
      @students = Student.left_outer_joins(:rooms).distinct.where("rooms.is_paid = true").order("created_at DESC")
  end

  def show
    @student = Student.find(params[:id])
    @room = Room.new
    @rooms = Room.where(student_id: params[:id])


    @paid_courses = 0
    @student.rooms.each do |room|
       if room.is_paid
        @paid_courses = @paid_courses + 1
       else
       end
    end
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
       redirect_to students_path, status: :see_other
     end

    private

     def student_params
       params.require(:student).permit(:first_name, :last_name,:contact_email,:contact_phone, :date_of_birth, :school, :is_converted, :channel, :photo, :allow_social, :full_name_contact, :last_contact,:is_cancelled, :school_hours )
     end

end
