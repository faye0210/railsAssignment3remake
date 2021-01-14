Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :edit, :update, :show]
  resources :favourites, only: [:create, :destroy, :show]
  root to: 'sessions#new'
  resources :posting_pages do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
