Logstew::Application.routes.draw do

  resources :dittos

  resources :questions do
    post :answer
    post :ditto
  end

  devise_for :stewards
  resources :stewards do
    resources :logs 
    resources :addresses , :only => [:new,:create]
  end
  resource :op, :only =>[] do
    get :host
    get :git
  end
  get "welcome/index"
  root :to => "welcome#index"
  match "/images/uploads/*path" => "grid_fs#serve"
end
