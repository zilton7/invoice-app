Rails.application.routes.draw do
  resources :clients

  resources :invoices do
    resources :services, only: %i[edit update], module: 'invoices'
    member do
      get :download, to: 'invoices#download'
    end
  end

  resources :services, only: [], param: :index do
    member do
      delete '(:id)' => 'services#destroy', as: ''
      post '/' => 'services#create'
    end
  end
end
