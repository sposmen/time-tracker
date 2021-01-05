Rails.application.routes.draw do
  resources :time_tracks do
    get :duplicate, action: :duplicate
    get :stop, action: :stop
    collection do
      post :start, action: :start
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
