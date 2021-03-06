  FreeCandy::Application.routes.draw do
  devise_for :users
  resources :users, :only => :show
  resources :videos, :only => :show
  resources :pictures, :only => :show

  root to: 'home#index'
  get 'paginate_results', :to => 'media#paginate_results'
  get 'event_media_pagination', :to => 'media#event_media_pagination'

  get 'editor/video', :to => 'editor#video'
  get 'editor/photo', :to => 'editor#photo'
  get 'editor/renderIO', :to => 'editor#renderStatus'
  post 'editor/renderIO', :to => 'editor#renderCommand'


  match 'search', to: 'media#search', via: :get
  match 'popular', to: 'media#popular', via: :get
  match 'update_popular', to: 'media#update_popular', via: :get
  match 'display', to: 'media#display', via: :get

  match 'find_event_media', to: 'event#find_event_media', via: :get
  match 'find_event', to: 'event#find_event', via: :get

  match 'recently_created_media', to: 'media#recent_media', via: :get
  match 'selected_media', to: 'media#selected_media', via: :get
  match 'event_media', to: 'media#event_media', via: :get

  get '/home/show' => 'home#show', as: :home

  get '/home/events' => 'event#popular_events', as: :home_events

  post "/save_media_to_session" => "media#save_media", :as => :save_media_to_session

  post "/remove_media_from_session" => "media#remove_media", :as => :remove_media_from_session

  get "/debug_grab_test_urls" => "home#debug_grab_test_urls", :as => :debug_grab_test_urls

  get "/users/:id" => 'users#show', as: :user_home

  post '/setTutorial', :to => 'home#toggle_tutorial'

end
