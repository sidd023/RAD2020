Rails.application.routes.draw do
  get 'microposts/new'
  get 'users/new'
  get 'hello' => 'hello#index'
end
