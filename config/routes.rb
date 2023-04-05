Rails.application.routes.draw do
  scope module: :public do
    #URLはpublicを消したいのでpublicのルートはこの中に記述する
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
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
