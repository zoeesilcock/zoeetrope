Zoeetrope::Application.routes.draw do
  resource :session do
    post :create
    get :destroy
  end

  get 'home/index'
  resources :projects do
    resources :used_technologies, only: %w[index create destroy]
    put 'used_technologies/sort', controller: :used_technologies, as: :sort_technologies
  end
  resources :screenshots, only: %w[index create edit update destroy]
  get 'contact', to: 'contact#index'
  root 'home#index'
end
