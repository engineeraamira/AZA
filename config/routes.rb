Rails.application.routes.draw do
  resources :currencies
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  #scope :ms1  do
  scope  module: 'ms1' do
    root 'transactions#index'

    resources :transactions
  end
end
