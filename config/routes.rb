Zoeetrope::Application.routes.draw do
  get 'home/index'
  resources :projects, only: [:index, :show]
  get 'contact', to: 'contact#index'
  root 'home#index'
end
