class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new # Needed to instantiate the form_for
  end

  def edit
    @course = Course.find(params[:id])
  end


  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
  end

  def create
    @course = Course.new(course_params)
    @course.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to courses_path, status: :see_other
  end

  private

  def course_params
    params.require(:course).permit(:name, :short_description, :long_description, :date, :price, :minimun_age, :max_age)
  end

end
