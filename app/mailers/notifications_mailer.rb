class NotificationsMailer < ActionMailer::Base
  default from: ENV["EMAIL_FROM"]
  default to: ENV["EMAIL_FROM"] #Doesn't matter because Sendgrid API...

  def email_announcement(announcement)
    recipients = get_user_list(announcement)
    build_header(recipients)
    mail(
      subject: announcement.name,
      body: announcement.message
      )
  end


  def get_user_list(announcement)
    if announcement.all_classes?
      users = User.where(role: "parent").where(active: true).pluck(:email)
    else
      users = User.where(role: "parent").where(active: true).joins(:groups).
      where(groups: { id: announcement.klasses }).pluck(:email)      
    end
    return users
  end

  def build_header(recipients)
    header = {
      "to" => recipients
    }.to_json
    headers["X-SMTPAPI"] = header
  end
end
