class DeveloperMailer < ActionMailer::Base
  def signup_notification(developer)
    setup_email(developer)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "http://developer.jurnalo.com/activate/#{developer.activation_code}"
  
  end
  
  def activation(developer)
    setup_email(developer)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://developer.jurnalo.com/"
  end
  
  protected
    def setup_email(developer)
      @recipients  = "#{developer.email}"
      @from        = "admin@mail.juranlo.com"
      @subject     = "[Jurnalo : Developer] "
      @sent_on     = Time.now
      @body[:developer] = developer
    end
end
