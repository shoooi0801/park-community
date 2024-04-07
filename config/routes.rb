Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root 'homes#top'
    get '/customers/my_page' => 'customers#show', as: "show_customers"
    get '/customers/information/edit' => 'customers#edit', as: 'edit_customers'
    get "/customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe_customers"
    patch '/customers/information' => 'customers#update'
    patch 'customers/withdraw' => 'customers/withdraw', as: "withdraw_customers"

    resources :posts, only: [:new, :index, :show,:create]
  end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  scope module: :admin do
    get "/admin/customers" => "customers#index", as: "customers_admin_index"
    get "/admin/customers/:id" => "customers#show", as: "customers_admin_show"
    get "/admin/customers/:id/edit" => "customers#edit", as: "customers_admin_edit"
    patch "/admin/customers/:id" => "customers#update", as: "customers_admin_update"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
