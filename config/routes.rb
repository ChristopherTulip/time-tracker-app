TimeTrackerApi::Application.routes.draw do
  root to: "entries#main"

  resources :users, only: [:create, :show, :destroy, :update] do
    resources :entries, only: [:create, :show, :destroy, :update]
  end

  resources :sessions, only: [:create, :destroy]

end
