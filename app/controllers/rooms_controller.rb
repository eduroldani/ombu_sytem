class RoomsController < ApplicationController


    def index
      @rooms = Room.all
    end

    def new
      @courses = Course.all
      @student = Student.find(params[:student_id])
      @room = Room.new
    end

    def create
      @room = Room.new(room_params)
      @student =  Student.find(params[:student_id])
      @course =  Course.find(params[:room][:course_id] )
      @room.course = @course
      @room.student = @student
      if @room.save
        redirect_to student_path(params[:student_id])
      else
        render :new, status: :unprocessable_entity
      end

    end

    private

     def room_params
       params.require(:room).permit(:is_paid, :course_id)
     end

end
