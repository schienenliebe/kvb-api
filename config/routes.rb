KvbApi::Application.routes.draw do

  resources :agencies do
    match 'agency' => 'agencies#gtfs'
    resources :stops, :only => :index
  end

  root :to => 'agencies#index'
end
