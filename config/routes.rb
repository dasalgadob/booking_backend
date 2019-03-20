Rails.application.routes.draw do
  resources :bookings do
    #get :count
  end
  resources :movies do
    get :count
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
