desc "Fetch emails from Gmail account"
task :fetch_emails => :environment do
  retrieve_emails
end

def retrieve_emails
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

  #feature = Feature.first

  puts "Fetching emails..."

  emails = Mail.find(keys: ['NOT','SEEN']) #Fetch emails marked as unread; will mark as read once fetched
  #emails = Mail.all                       #Fetch all emails
  puts "Fetched #{emails.length} emails"
  emails.each do |e|
    #puts "Delivering emails..."    
    #deliver_email(e)

    split_body = e.body.decoded.to_s.split(' ')
    split_body.each do |word|
      if word.include?("@@") == true
        puts "----------------"
        puts "Code is: #{word}" #Add to parse out any leading or trailing characters with < or >
        word.slice!("@@")
        feature = Feature.find_by_code(word)

        if feature
          e.header[:to].each do |t|
            name = t.name
            email = t.address
            format = t.format
            user = User.find_by_email(email)

            if user
              unless user.following?(feature) == true
                user.follow!(feature)
                puts "#{feature.title} followed by #{user.email}"
                #Email feature to existing user w/ new relationship
                deliver_email(user.email_formatted, feature)
                puts "Sending email..."
              end
            else
              #Creat user
              user = User.create!(:name => name, :email => email, :email_display_name => name, :email_formatted => format)
              puts "User created: #{user.email}"

              #Follow feature
              user.follow!(feature)
              puts "#{feature.title} followed by #{user.email}"

              #Email feature to new user w/ new relationship
              deliver_email(user.email_formatted, feature)
              puts "Sending email..."
            end
          end
        else
          puts "No feature was found with code: #{word}"
        end
      end

    end
  end
end

def deliver_email(email_address, feature)
  #mail = Mail.new
  #mail.add_file(Valet::Application.assets.find_asset('rails.png').pathname.to_s)

  template = File.read("#{Rails.root}/app/views/emails/features/show.html.erb")
  @feature = feature
  renderer = ERB.new(template)
  result = renderer.result(binding)

  mail = Mail.new do
       from "Valet <featurevalet@gmail.com>"
         to "#{email_address}"
    subject "Valet: #{feature.title}"
       # body "Title: #{feature.title}\n\nDescription: #{feature.description}"
   # add_file Valet::Application.assets.find_asset('rails.png').pathname.to_s
   # add_file Valet::Application.assets.find_asset('kayak_1.png').pathname.to_s
   feature.attachments.each do |attachment|
     add_file Valet::Application.assets.find_asset(attachment.name).pathname.to_s
   end
       html_part do
         content_type 'text/html; charset=UTF-8'
         body result
       end
  end

  mail.deliver!
end