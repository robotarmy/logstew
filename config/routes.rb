Logstew::Application.routes.draw do
  devise_for :stewards
  get "welcome/index"
  root :to => "welcome#index"

end
