TimeTrackerApi::Application.routes.draw do
  root to: "entries#main"

  resources :users do
    resources :entries
  end

  resources :sessions, only: [:create, :destroy]

end
