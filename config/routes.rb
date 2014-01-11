Zoeetrope::Application.routes.draw do
  get "projects/index"
  get "projects/show"
  get "home/index"
  root 'home#index'
end
