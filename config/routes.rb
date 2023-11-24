Rails.application.routes.draw do
  root 'pacjenci#index'
  get '/pacjenci', to: 'pacjenci#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
