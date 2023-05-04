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
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'cart_item/destroy_all'
    resources :cart_items, only: [:create, :index, :update, :destroy]
    get 'orders/complete' => 'orders#complete', as: 'orders/complete'
    post 'orders/confirm' => 'orders#confirm', as: 'orders/confirm'
    resources :orders, only: [:new, :index, :show, :create]
  end
  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:create, :index, :new, :show, :edit, :update]
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions:      'admin/sessions'
}
devise_for :customers,skip: [:passwords], controllers: {
  sessions:      'public/sessions',
  registrations: 'public/registrations'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
