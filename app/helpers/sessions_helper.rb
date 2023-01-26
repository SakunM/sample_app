module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
    session[:session_token] = user.session_token
  end
  
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user && session[:session_token] == user.remember_digest
        @current_user = user
      end
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user && user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end

__END__
app/models/user.rb   user
app/controllers/sessions_controller.rb  ns_c
app/controllers/users_controller.rb     rs_c
app/helpers/sessions_helper.rb          ns_h
app/helpers/users_helper.rb             rs_h

app/views/users/edit.html.erb           u/e
app/views/users/new.html.erb	      		u/n
app/views/users/index.html.erb			    u/i
app/views/users/_form.html.erb          _f
app/views/layouts/_header.html.erb      _h
app/views/layouts/_user.html.erb        _u

app/assets/stylesheets/custom.scss		custom
app/javascript/custom/menu.js		    menu

db/seeds.rb                             seed