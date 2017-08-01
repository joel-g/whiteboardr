class ApplicationMailer < ActionMailer::Base
  default from: 'Whiteboardrhelp@gmail.com'
  layout 'mailer'

  def default_url_options
    if Rails.env.development? || Rails.env.test?
      {:host => "localhost:3000"}
    elsif Rails.env.production?
      {:host => "whiteboardr.herokuapp.com"}
    else
      {}
    end
  end

end
