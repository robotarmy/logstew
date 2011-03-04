# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :steward do |f|
  f.email {Factory.next :email}
  f.password 'histewry'
end

Factory.define :log do |f|
  f.story 'hi story'
  f.title 'title'
  f.steward { Factory(:steward) }
end

