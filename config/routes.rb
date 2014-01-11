Zoeetrope::Application.routes.draw do
  get "contact/index"
  get "projects/index"
  get "projects/show"
  get "home/index"
  root 'home#index'
end
