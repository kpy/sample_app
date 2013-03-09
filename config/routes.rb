SampleApp::Application.routes.draw do
  get "static_pages/home"

  get "static_pages/help"

  get "static_pages/about"
  
  #get "about" => "static_pages#contact", :as "about"

  root :to => 'static_pages#home'

  #resources :static_pages
end
