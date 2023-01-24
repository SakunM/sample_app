module UsersHelper
  def gravatar_for(user)
    image_tag('tutorial.png', alt: user.name, class: 'gravatar')
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