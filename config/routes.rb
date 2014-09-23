Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :nonprofits do
    resources :donations, :except => [:index, :edit, :update]
  end
end
