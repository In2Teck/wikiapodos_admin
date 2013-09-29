Wikiapodos::Application.routes.draw do
  devise_for :admin_users

  resources :reportes


  resources :objetos


  resources :imagenes


  resources :cuerpos


  resources :compartidos


  resources :usuarios do
    match 'get_apodos_creados'
    match 'get_apodos_asignados'
    match 'update_ganador'
  end


  resources :categorias


  resources :calificaciones


  resources :apodos_usuarios


  resources :apodos do
    match 'update_visible'
    match 'update_destacado'
    match 'get_usuarios'
    match 'update_estrella'
  end 

  devise_scope :admin_user do
	  get 'logout', :to => "devise/sessions#destroy"
	  get 'signin', :to => "devise/sessions#new"
  end

  match 'test_upload' => 'display#test_upload'
  
  match 'test_upload_send' => 'display#test_upload_send'

  match 'incidencias' => 'apodos_usuarios#incidencias'

  match 'remind_usuarios' => 'display#remind_usuarios'  

  match 'clear_contest' => 'display#clear_contest'  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'display#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
