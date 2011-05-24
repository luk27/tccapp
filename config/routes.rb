Tccapp::Application.routes.draw do


  resources :profiles do
  resources :cursos, :only => [:new, :create, :destroy]
  #resources :projetos, :only => [:new, :create, :destroy]
             resources :messages do
               collection do
                 post :delete_selected
               end
             end
           end

#resources :profiles do
#resources :cursos, :only => [:new, :create, :destroy]
#end

resources :projetos  ##TIRA O DO E O END QUALQUER COISA
resources :equipes
resources :avaliacaos

resources :postagems
 
 
resources :sessions, :only => [:new, :create, :destroy]

  match '/entrar', :to => 'sessions#new'

  
  match '/profiles/:id_profile/cursos/:id_curso', :to => 'cursos#destroy'
  #match '/projetos/:id_projeto/edit', :to => 'projetos#edit'

  match '/sair', :to => 'sessions#destroy'

  match '/cadastrar', :to => 'profiles#novo'

  match '/contato', :to => 'paginas#contato'

  match '/sobre', :to => 'paginas#sobre'

  match '/ajuda', :to => 'paginas#ajuda'

  match '/profiles/:id_profile/messages', :to => 'messages#index'

  match '/profiles/:id_profile/messages/:id_message', :to => 'messages#show'
  
 # match '/equipes/:id_equipe/', :to => 'profile/:membro_id/', :action => 'profile#show'
  
  #match '/equipes#show', :to => 'profile#show'

  root :to => 'paginas#home'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Sample resource route with options:
  # resources :products do
  # member do
  # get 'short'
  # post 'toggle'
  # end
  #
  # collection do
  # get 'sold'
  # end
  # end

  # Sample resource route with sub-resources:
  # resources :products do
  # resources :comments, :sales
  # resource :seller
  # end

  # Sample resource route with more complex sub-resources
  # resources :products do
  # resources :comments
  # resources :sales do
  # get 'recent', :on => :collection
  # end
  # end

  # Sample resource route within a namespace:
  # namespace :admin do
  # # Directs /admin/products/* to Admin::ProductsController
  # # (app/controllers/admin/products_controller.rb)
  # resources :products
  # end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

