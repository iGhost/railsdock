Rails.application.routes.draw do
  root 'pages#home'
  get '/pages/article', 'pages#article'
end
