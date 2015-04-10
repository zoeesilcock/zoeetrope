Zoeetrope::Application.routes.draw do
  resource :session do
    post :create
    get :destroy
  end

  root 'home#index'
  get 'home/index'
  get 'contact', to: 'contact#index'

  resources :projects do
    resources :used_technologies, only: %w[index create destroy]
    put 'used_technologies/sort', controller: :used_technologies, as: :sort_technologies
  end

  resources :screenshots, only: %w[index create edit update destroy]

  get 'sitemap.xml' => 'home#sitemap', format: :xml, as: :sitemap
  get 'robots.txt' => 'home#robots', format: :text, as: :robots
end
