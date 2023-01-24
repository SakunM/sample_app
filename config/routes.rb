Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to:'static_pages#help'
  get    '/about',   to:'static_pages#about'
  get    '/contact', to:'static_pages#contact'
  get    '/signup',  to:'users#new'
  get    '/login',   to:'sessions#new'
  post   '/login',   to:'sessions#create'
  delete '/logout',  to:'sessions#destroy'
  resources :users
end

__END__
app/models/user.rb   user
app/controllers/sessions_controller.rb  ns_c
app/controllers/users_controller.rb     rs_c
app/helpers/sessions_helper.rb          ns_h

config/routes.rb    routes

app/views/users/edit.html.erb           u/e
app/views/layouts/_header.html.erb      _h
