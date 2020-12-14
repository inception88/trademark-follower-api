Rails.application.routes.draw do
  scope '/api/v1' do
    resources :users, only: [:create]
    resources :trademarks
    post "/login", to: "auth#login"
    get "/auto_login", to: "auth#auto_login"
    get "/user_is_authed", to: "auth#user_is_authed"
  end
end
