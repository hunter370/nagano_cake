Rails.application.routes.draw do
 
  scope module: :public do
    #URLはpublicを消したいのでpublicのルートはこの中に記述する
    #'指定したいURL' => 'コントローラー名#アクション名', as: 'ルートパス'
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get 'customers/my_page' => 'customers#show', as: 'customers/show'
    get 'customers/information/edit' => 'customers#edit', as: 'customers/edit'
    get 'customers/unsubscribe'
    patch 'customers/information' => 'customers#update', as: 'customers/update'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customers/withdraw'
    get 'addresses' => 'addresses#index', as: 'addresses/index'
    post 'addresses' => 'addresses#create',as: 'addresses'
    get 'addresses/:id/edit' => 'addresses#edit', as: 'addresses/edit'
    patch 'addresses/:id' => 'addresses#update', as: 'addresses/update'
  end
  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:create, :index, :new, :show, :edit, :update]
  end
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
