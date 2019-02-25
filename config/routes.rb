Rails.application.routes.draw do
  get 'new', to: 'games#new'
  get 'reset', to: 'games#reset'
  get 'score', to: 'games#score'
  post 'score', to: 'games#score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
