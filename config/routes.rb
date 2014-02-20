TimeTrackerApi::Application.routes.draw do
  devise_for :users
  root to: "entries#main"

  resources :users do
    resources :entries
  end
end
