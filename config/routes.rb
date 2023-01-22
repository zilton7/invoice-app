Rails.application.routes.draw do
  resources :clients
  resources :invoices

  resources :services, only: [], param: :index do
    member do
      delete '(:id)' => 'services#destroy', as: ''
      post '/' => 'services#create'
    end
  end
end
