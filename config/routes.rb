Rails.application.routes.draw do

  get 'welcome/index' => 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  #Routes para produtos
  get 'produto/(.:format)'      => 'produto#index'
  get 'produto/:nome(.:format)' => 'produto#show'

  #Routes para clientes
  get '/clientes/new'           => 'clientes#new'
  get '/clientes/(.:format)'    => 'clientes#index'
  get '/clientes/:id(.:format)' => 'clientes#show'

  #Routes para prodencomendado
  get 'prodencomendados/create' => 'prodencomendados#create'
  get 'prodencomendados/update' => 'prodencomendados#update'
  get 'prodencomendados/destroy' => 'prodencomendados#destroy'

  #Routes get carrinhos
  get 'carrinhos/show' 

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase


  #Sessions
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'
  post   'logout'  => 'sessions#destroy'

  get "sessions/create"
  get "sessions/destroy"

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :pedidos, :clientes, :produto
  resource :carrinhos, only: [:show]
  resources :prodencomendados, only: [:create, :update, :destroy]

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  delete '/clientes/:id(.:format)' => 'clientes#destroy'
  delete '/produtos/:id(.:format)' =>  'articles#destroy'
end
