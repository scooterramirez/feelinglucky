Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users

  # resources :likes

  get 'users/:id/likes', to: 'users#likes', as: :likes


  resources :users do
  member do
    get :follow
    get :unfollow
  end
end

resources :messages do
  member do
    post :new
  end
end

resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_tra
end
