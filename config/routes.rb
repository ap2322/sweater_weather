Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      resources :users, only: [:create], defaults: { format: :json }
      resources :sessions, only: [:create], defaults: { format: :json }
    end
  end
end
