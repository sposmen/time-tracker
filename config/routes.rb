Rails.application.routes.draw do
  resources :time_tracks do
    collection do
      get '(:date)', action: :index, constraints: { date: /\d{4}-\d{2}-\d{2}/ }, as: 'events_date'
      post :start, action: :start
    end
    get :duplicate, action: :duplicate
    get :stop, action: :stop
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end