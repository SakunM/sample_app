module UsersHelper
  def gravatar_for(user, size: 50)
    image_tag('tutorial.png', alt: user.name, class: 'gravatar', width: size)
  end
end

__END__