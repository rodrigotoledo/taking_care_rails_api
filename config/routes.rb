Rails.application.routes.draw do
  post "sign_up", to: "registrations#create", as: :sign_up
  post "sign_in", to: "sessions#create", as: :sign_in
  delete "logout", to: "sessions#destroy", as: :logout
end
