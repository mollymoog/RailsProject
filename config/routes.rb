Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => "omniauth_callbacks"}
  resources :users, only: [:show]
  resources :outcrops, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :outcrops, only: [:index, :show, :new, :create, :edit, :update]
  end

  #after signed in, go here:
  root to: "users#show"
  # devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
