Rails.application.routes.draw do
  resources :pacjents
  resources :doktors, only: [:index]
  resources :appointments, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
