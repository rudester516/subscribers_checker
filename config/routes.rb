Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  post 'home/process_csvs'
end
