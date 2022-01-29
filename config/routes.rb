Rails.application.routes.draw do
  get 'apps/index'

  #match ':controller(/:action(/:id))(.:format)' : via=> get

 #get 'apps/new'

 #match '/new',   :to => 'apps#new', via: [:get]

 resources :apps, :only => [:new, :create, :show, :edit, :update] do
   resources :chats, :only => [:create, :show] do
     resources :messages, :only => [:index]
   end
 end

 resources :chats, :only => [:create, :show] do
   resources :messages, :only => [:create]
 end

 #resources :apps

 #post 'app/'
 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 # Defines the root path route ("/")
  root "apps#index"
end
