Rails.application.routes.draw do
  devise_for :admin
  devise_for :customer
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
