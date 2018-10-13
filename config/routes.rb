Rails.application.routes.draw do

  devise_for :managers, :controllers => {
    sessions: 'managers/sessions',
    registrations: 'managers/registrations',
    passwords: 'managers/passwords'
  }

  namespace :managers do
    resources :articles
  end

  root 'articles#index'
end
