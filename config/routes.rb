Rails.application.routes.draw do
  root 'audios#index'

  resources :audios do
    member do
      get :download
    end
  end
end
