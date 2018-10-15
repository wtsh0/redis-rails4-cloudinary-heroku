Rails.application.routes.draw do

  devise_for :managers, controllers: {
    sessions: 'managers/sessions',
    registrations: 'managers/registrations',
    passwords: 'managers/passwords'
  }

  namespace :managers do
    resources :articles
  end

  namespace :public do
    resources :articles, only: [:index, :show] do
      get 'add_pv', on: :member
    end
  end
  root 'public/articles#index'
end
