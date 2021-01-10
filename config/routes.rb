Rails.application.routes.draw do
  resources :time_tracks do
    collection do
      get '(:date)', action: :index, constraints: { date: /\d{4}-\d{2}-\d{2}/ }, as: :events_date
      post :start, action: :start
    end
    get :duplicate, action: :duplicate
    get :stop, action: :stop
  end
  resources :report, only: [:index] do
    collection do
      get '(:date)', action: :index, constraints: { date: /\d{4}-\d{2}-\d{2}/ }, as: :report_date
    end
  end
end
