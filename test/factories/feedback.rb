# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :feedback do |f|
  f.comment("default")
  f.answers({"1?" => "one"})
end
