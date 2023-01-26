require 'digest'

def about_div
  10.times { |i| puts i % 3}
end

def md5
  email = 'mamoru.sakuma@gmaiil.com'
  res = Digest::MD5::hexdigest(email)
  puts res
end

if __FILE__ == $0 then
  md5
end

__END__

user = User.new(name: 'Foo Bar', email: 'foo@invalid.com',
  password: 'password', password_confirmation: 'password')

session = {}; session[:user_id] = nil
session[:user_id] = User.first.id
@current_user ||= User.find_by(id: session[:user_id])

