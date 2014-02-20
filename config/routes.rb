TimeTrackerApi::Application.routes.draw do
  devise_for :users
  root to: "entries#main"

  resources :entries
  resources :users # not implemented yet
end
