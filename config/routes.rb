Zoeetrope::Application.routes.draw do
  resource :session do
    post :create
    get :destroy
  end

  get 'home/index'
  resources :projects
  get 'contact', to: 'contact#index'
  root 'home#index'
end
