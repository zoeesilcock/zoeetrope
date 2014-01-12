Zoeetrope::Application.routes.draw do
  get "home/index"
  resources :projects, only: [:index, :show]
  get "contact/index"
  root 'home#index'
end
