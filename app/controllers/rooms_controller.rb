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
      if @room.course.price == @room.ammount || @room.modified_price == @room.ammount
        @room.is_paid = true
        @room.save
        if @room.save
          redirect_to student_path(params[:student_id])
        else
          render :new, status: :unprocessable_entity
        end
      elsif @room.course.price != @room.ammount || @room.modified_price != @room.ammount
        @room.is_paid = false
        @room.save
        if @room.save
          redirect_to student_path(params[:student_id])
        else
          render :new, status: :unprocessable_entity
        end
      end
      end


    # def update
    #   @student = Student.find(params[:student_id])
    #   @room = Room.find_by(student_id: @student, id: params[:id])
    #   if @room.is_paid == true
    #      @room.is_paid = false
    #   else
    #      @room.is_paid = true
    #   end
    #   @room.save
    #     redirect_to student_path(@student)
    # end

    def edit
      @student = Student.find(params[:student_id])
      @room = Room.find(params[:id])
    end

    def update
      @room = Room.find(params[:id])
      @room.update(room_params)
      if @room.course.price == @room.ammount || @room.modified_price == @room.ammount
        @room.is_paid = true
        @room.save
      elsif @room.course.price != @room.ammount || @room.modified_price != @room.ammount
        @room.is_paid = false
        @room.save
      end
      redirect_to student_path(params[:student_id])
    end

    def destroy
      @student = Student.find(params[:student_id])
      @room = Room.find_by(student_id: @student, id: params[:id])
      @room.destroy
      # No need for app/views/restaurants/destroy.html.erb
      redirect_to student_path(params[:student_id])
    end

    private

     def room_params
       params.require(:room).permit(:is_paid, :course_id,:ammount, :modified_price)
     end

end
