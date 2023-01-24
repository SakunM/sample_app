class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user &.authenticate(params[:session][:password])
      reset_session
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      log_in @user
      redirect_to @user
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
app/helpers/sessions_helper.rb          ns_h

!!(u && u.authenticate('foobar'))

session = {}
session[:user_id] = nil
@current_user ||= User.find_by(id: session[:user_id])

session[:user_id] = User.first.id
