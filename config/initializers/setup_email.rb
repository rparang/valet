Mail.defaults do
  delivery_method(:smtp, {  :address              => "smtp.gmail.com",
                            :port                 => 587,
                            :domain               => 'herokuapp.com',
                            :user_name            => 'featurevalet@gmail.com',
                            :password             => 'temporary1337',
                            :authentication       => 'plain',
                            :enable_starttls_auto => true  }
                  )

  retriever_method :imap, { :address    => "imap.gmail.com",
                            :port       => 993,
                            :user_name  => 'featurevalet@gmail.com',
                            :password   => 'temporary1337',
                            :enable_ssl => true }
end