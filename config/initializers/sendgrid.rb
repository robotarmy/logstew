ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.sendgrid.net",
    :port => 25,
    :domain => 'smtp.sendgrid.net',
    :user_name => 'sendgrid.com@robotarmyma.de',
    :password => 'rammail',
    :authentication => 'plain'
}
