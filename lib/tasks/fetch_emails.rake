desc "Fetch emails from Gmail account"
task :fetch_emails => :environment do
  retrieve_emails
end


def retrieve_emails
  Mail.defaults do
    delivery_method(:smtp, {  :address              => "smtp.gmail.com",
                              :port                 => 587,
                              :domain               => 'localhost:3000',
                              :user_name            => 'featurevalet',
                              :password             => 'temporary1337',
                              :authentication       => 'plain',
                              :enable_starttls_auto => true  }
                    )

    retriever_method :imap, { :address    => "imap.gmail.com",
                              :port       => 993,
                              :user_name  => 'featurevalet',
                              :password   => 'temporary1337',
                              :enable_ssl => true }
  end

  feature = Feature.first

  puts "Fetching emails..."

  #emails = Mail.find(keys: ['NOT','SEEN']) #Fetch emails marked as unread; will mark as read once fetched
  emails = Mail.all                       #Fetch all emails
  puts "Fetched #{emails.length} emails"
  emails.each do |e|
    #puts "Delivering emails..."    
    #deliver_email(e)

    e.header[:to].each do |t|
      name = t.name
      email = t.address
      format = t.format

      user = User.find_by_email(email)

      if user
        unless user.following?(feature) == true
          user.follow!(feature)
          puts "#{feature.title} followed by #{user.email}"
        end
      else
        user = User.create!(:name => name, :email => email, :email_display_name => name, :email_formatted => format)
        puts "User created: #{user.email}"
        user.follow!(feature)
        puts "#{feature.title} followed by #{user.email}"
      end

    end
  end
end

def deliver_email(email)
  feature = Feature.first

  Mail.deliver do
         to "#{email.to[0]}"
       from "Valet <featurevalet@gmail.com>"
    subject "Valet: #{feature.title}"
       body "Title: #{feature.title}\n\nDescription: #{feature.description}\n\nEmail: #{email}"
  end
end