module UsersHelper
  def gravatar_for(user)
    image_tag('tutorial.png', alt: user.name, class: 'gravatar')
  end
end
