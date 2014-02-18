ActionMailer::Base.smtp_settings = {
  :address        => "smtp.gmail.com",
  :port         => 587,
  :domain       => "pure-sands-7079.herokuapp.com/",
  :user_name      => "featurevalet",
  :password       => "temporary1337",
  :authentication   => "plain",
  :enable_starttls_auto => true
}