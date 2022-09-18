class CoursesController < ApplicationController

  def index
    if params[:query].present?
      @courses = Course.search_by_name_short_description(params[:query])
    else
      @courses = Course.where(is_hide: false).order("created_at ASC")
    end
  end

  def robotica
    @courses = Course.where(category: 'Robotica').and(Course.where(is_hide: false))
  end


  def talleres_gratuitos
    @courses = Course.where(category: 'Talleres Gratuitos').and(Course.where(is_hide: false))
  end


  def programacion
    @courses = Course.where(category: 'Programacion').and(Course.where(is_hide: false))
  end


  def all_courses
    @courses = Course.all.order("created_at DESC")
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
    params.require(:course).permit(:name, :short_description, :long_description, :date, :price, :minimun_age, :max_age, :photo, :what, :how, :project, :capacity,:category, :is_hide, :is_confirm )
  end

end
