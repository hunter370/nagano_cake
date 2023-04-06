Rails.application.routes.draw do
 
  scope module: :public do
    #URLはpublicを消したいのでpublicのルートはこの中に記述する
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get 'customers/my_page/:id' => 'customers#show', as: 'customers/show'
    # current_customer実装後に:idを削除する
    get 'customers/information/edit/:id' => 'customers#edit', as: 'customers/edit'
    # current_customer実装後に:idを削除する
    get 'customers/unsubscribe'
    patch 'customers/information/:id' => 'customers#update', as: 'customers/update'
  end
  namespace :admin do
    root to: "homes#top"
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
