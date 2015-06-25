Inventorymaster::Engine.routes.draw do

  resources :reports
  get 'current_stock_list',:controller=>'reports',:action=>'current_stock_list'
  get 'moviments_by_months',:controller=>'reports',:action=>'moviments_by_months'
  get 'low_stock_list',:controller=>'reports',:action=>'low_stock_list'
  get 'out_stock_list',:controller=>'reports',:action=>'out_stock_list'



  resources :transaction_types
  resources :transactions do
  get ':transactions/:id', to: 'transactions#new', on: :member
end

  #resources :products do
  #get :autocomplete_product_name, :on => :collection
#end
  resources :settings
  resources :manufacturers
  resources :areas
  resources :locations
	root :to => 'stok#index'
	#get '/transactions/new/:id' =>'transactions#new'



resources :products do
    collection do
      post :import
      get :autocomplete # <= add this line
    end
  end

end
