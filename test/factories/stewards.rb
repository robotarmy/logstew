
 Sham.email {|n| "#{n}@example.com" }
Steward.blueprint do
	email  {Sham.email}
	password {'letmein'}
end
