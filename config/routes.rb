Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace :api do
     resources :campaigns, only: [:index, :new, :show, :update]
     resources :products, only: [:index, :show]
     resources :products, only: [:show] do 
      resources :campaigns, only: [:index, :new, :show, :update]
     end 
   end 
end
