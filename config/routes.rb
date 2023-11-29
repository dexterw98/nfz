# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pacjents#index'
  resources :pacjents do
    get 'urodzenia_statystyki', on: :collection
  end
  resources :doktors, only: [:index]
  resources :appointments do
    get 'pacjent', on: :member
  end
end
