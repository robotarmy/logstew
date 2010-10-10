Logstew::Application.routes.draw do
  resources :things

  devise_for :stewards
  resources :logs , :only => [:index,:new,:create]
  get "welcome/index"
  root :to => "welcome#index"
  match "/images/uploads/*path" => "grid_fs#serve"
end
