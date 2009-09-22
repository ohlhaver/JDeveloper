class DeveloperObserver < ActiveRecord::Observer
  def after_create(developer)
    DeveloperMailer.deliver_signup_notification(developer)
  end

  def after_save(developer)
  
    DeveloperMailer.deliver_activation(developer) if developer.recently_activated?
  
  end
end
