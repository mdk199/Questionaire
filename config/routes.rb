Rorproject::Application.routes.draw do
  resources :profiles


  resources :profile

 
  resources :interests


  resources :points_histories


  resources :points_maps


  resources :flags


  resources :comments


  resources :expertises


  resources :answers do
    member do
      get "approve", to: "answers#approve"
      get "unapprove", to: "answers#unapprove"
    end
  end

  devise_for :users

  match "all_questions" => "questions#all_questions"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :questions do
    collection do
      get 'answers/:id', to: 'questions#answers'
      get "expertise", to: "questions#expertise_questions"
      get "interest", to: "questions#interest_questions"
    end

    member do
      get "flag", to: "questions#flag"
      get "unflag", to: "questions#unflag"
      get "publish", to: "questions#publish"
      get "unpublish", to: "questions#unpublish"
      get "add_answer", to: "questions#add_answer"
    end
  end

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

  get 'about_us' => 'welcome#about_us'
  get 'contact_us' => 'welcome#contact_us'
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
