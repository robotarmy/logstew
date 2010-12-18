# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :steward do |f|
  f.email Factory.next :email
  f.password 'histewry'
end

Factory.define :elder, :parent => :steward do |f|
  f.elder true
end

