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
  resources :account_activations, only: [:edit]
end

__END__
app/models/user.rb   user
app/controllers/sessions_controller.rb  ns_c
app/controllers/users_controller.rb     rs_c
app/controllers/account_activations_controller.rb  ac_con
app/helpers/sessions_helper.rb          ns_h
app/helpers/users_helper.rb             rs_h
app/mailers/application_mailer.rb		ap_m
app/mailers/user_mailer.rb              u_m

app/views/users/edit.html.erb           u/e
app/views/users/new.html.erb			u/n
app/views/users/index.html.erb			u/i
app/views/users/_form.html.erb          _f
app/views/layouts/_header.html.erb      _h
app/views/layouts/_user.html.erb        _u
app/views/user_mailer/account_activation.html.erb  acac
app/views/user_mailer/account_activation.text.erb　acac.t


app/assets/stylesheets/custom.scss		custom
app/javascript/custom/menu.js		    menu

db/seeds.rb                             seed

db/migrate/[timestamp]_add_activation_to_users.rb	 act

config/environments/development.rb     dev
config/environments/test.rb            env/t
