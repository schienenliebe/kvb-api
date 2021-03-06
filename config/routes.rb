KvbApi::Application.routes.draw do

  resources :agencies do
    match 'agency' => 'agencies#gtfs'
    match 'calendar' => 'calendar_services#index'
    resources :calendar_services, only: [:index]
    resources :routes, :only => :index
    resources :stops, :only => :index
    resources :stop_times, :only => :index
  end

  root :to => 'agencies#index'
end
