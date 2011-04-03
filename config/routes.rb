Logstew::Application.routes.draw do
  resources :feedback

  devise_for :stewards

  resources :comments , :only => [:create]

  resources :stewards do
    resources :logs 
    resources :addresses , :only => [:new,:create]
  end

  resource :op do
    get :host
    get :git
  end
  get "welcome/index"
  root :to => "welcome#index"
end
