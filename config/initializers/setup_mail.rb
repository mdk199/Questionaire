ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "potaliproject@gmail.com",
  :password             => "84pass26",
  :authentication       => "plain",
  :enable_starttls_auto => true
}