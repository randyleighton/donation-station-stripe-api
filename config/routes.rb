Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root to: 'welcome#index'
  resources :nonprofits do
    resources :donations, :except => [:index, :edit, :update]
  end

  resources :plans, :except => [:edit, :update, :destroy] do
    resources :subscriptions, :except => [:edit, :update]
  end

  resources :subscriptions, :only => :index
end
