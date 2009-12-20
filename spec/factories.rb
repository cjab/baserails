Factory.define :user do |u|
  u.login 'holden'
  u.email 'holden@dinocore.net'
  u.password 'crocodile'
  u.password_confirmation { |a| a.password }
end
