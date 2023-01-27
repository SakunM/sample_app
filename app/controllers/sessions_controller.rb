class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user &.authenticate(params[:session][:password])
      if @user.activated?
        forwarding_url = session[:forwarding_url]
        reset_session
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        log_in @user
        redirect_to  forwarding_url || @user
      else
        message = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity  
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end

__END__
app/models/user.rb   user
app/controllers/sessions_controller.rb  ns_c
app/controllers/users_controller.rb     rs_c
app/helpers/sessions_helper.rb          ns_h
app/helpers/users_helper.rb             rs_h

app/views/users/edit.html.erb           u/e
app/views/users/new.html.erb			u/n
app/views/users/index.html.erb			u/i
app/views/users/_form.html.erb          _f
app/views/layouts/_header.html.erb      _h
app/views/layouts/_user.html.erb        _u

app/assets/stylesheets/custom.scss		custom
app/javascript/custom/menu.js		    menu

