Rails.application.routes.draw do
  resources :pacjents do
    get 'urodzenia_statystyki', on: :collection
  end
  resources :doktors, only: [:index]
  resources :appointments do
    get 'pacjent', on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
