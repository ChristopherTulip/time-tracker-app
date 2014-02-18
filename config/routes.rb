TimeTrackerApi::Application.routes.draw do
  root to: "entries#main"

  resources :entries
  resources :users
end
