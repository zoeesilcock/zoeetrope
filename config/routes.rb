Zoeetrope::Application.routes.draw do
  resource :session do
    post :create
    get :destroy
  end

  get 'home/index'
  resources :projects do
    get 'technologies'
    put 'technologies_order'
  end
  get 'contact', to: 'contact#index'
  root 'home#index'
end
