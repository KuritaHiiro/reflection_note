Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :notes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :memos, only: [:create, :destroy]
  end

  resources :book_marks, only: [:index, :create, :show, :update, :destroy]
  resources :book_mark_details, only: [:create, :destroy]
  resource :user, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
