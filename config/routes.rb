#*DTA Here!
Rails.application.routes.draw do
  get 'message', to: 'message#index'
  resource  :session
  resources :examples

  resources :messages do
    resources :comments
  end

  resources :syncs
  resources :rick
  resources :integration

  root 'examples#index'
end
