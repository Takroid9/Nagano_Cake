Rails.application.routes.draw do

  namespace :public do
    get 'address/index'
    get 'address/edit'
  end

  resources :customers, only: [:show, :edit, :update]

  devise_for :admins, controllers: {
    registrations: 'admins/registrations'
  }


  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }

  namespace :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end


  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
