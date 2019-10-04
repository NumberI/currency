Rails.application.routes.draw do
  get 'admin' => 'admin#new'
  match 'admin/update', to: 'admin#update', via: [:post,:patch]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'main#root'
  root :to => "main#root"
end
