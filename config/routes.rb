Zoeetrope::Application.routes.draw do
  resource :session do
    post :create
    get :destroy
  end

  get 'home/index'
  resources :projects, only: [:index, :show]
  get 'contact', to: 'contact#index'
  root 'home#index'
end
