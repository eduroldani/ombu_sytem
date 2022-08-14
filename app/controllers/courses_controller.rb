class CoursesController < ApplicationController

  def index
    if params[:query].present?
      @courses = Course.search_by_name_short_description(params[:query])
    else
      @courses = Course.all.order("date DESC")
    end
  end

  def robotica
    @courses = Course.where(category: 'Robotica')
  end

  def tresd
    @courses = Course.where(category: 'Diseño Y Impresion 3D')
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
    redirect_to course_path(@course)
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end


  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :short_description, :long_description, :date, :price, :minimun_age, :max_age, :photo, :what, :how, :project, :capacity,:category )
  end

end
