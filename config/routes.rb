Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => "omniauth_callbacks"}
  resources :outcrops, only: [:index, :show, :new, :create, :edit, :update]
  resources :projects, only: [:index, :show, :new, :create, :edit, :update]
  #after signed in, go here:
  root to: "outcrops#index"
  # devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
