Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  authenticate :user, ->(user) { user.is_admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    get "/courses/robotica", to: "courses#robotica", as: :courses_robotic
    get "/courses/talleres_gratuitos", to: "courses#talleres_gratuitos", as: :courses_free_courses
    get "/courses/programacion", to: "courses#programacion", as: :courses_programming
    get "/courses/3d", to: "courses#tresd", as: :courses_design
    get "/courses/todos", to: "courses#all_courses", as: :all_courses

    # Read all
    get "/courses", to: "courses#index", as: :courses
    # Create
    get "courses/new",to: "courses#new",  as: :new_course
    post "courses", to: "courses#create"
    # Read one - The `show` route needs to be *after* `new` route.
    get "courses/:id", to: "courses#show", as: :course
    # Update
    get "courses/:id/edit", to: "courses#edit", as: :edit_course
    patch  "courses/:id", to: "courses#update"
    # Delete
    delete "courses/:id", to: "courses#destroy"

  # resources :students

    get "/students/paid", to: "students#paid", as: :paid_students

    resources :students do
      resources :rooms
    end




end
