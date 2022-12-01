Rails.application.routes.draw do
  root "work_orders#index"

  get "/work_orders", to: "work_orders#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
