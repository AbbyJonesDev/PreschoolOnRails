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

  def email_peek(peek)
    recipients = User.all.pluck(:email)
    build_header(recipients)
    attachments["Peek#{peek.date}"] = open("#{peek.file.url}").read
    mail(
      subject: "Peek at Our Week(s) Available Now",
      body: "A new peek at our upcoming weeks is available now."
      )
  end

  def email_newsletter(newsletter)
    recipients = User.all.pluck(:email)
    build_header(recipients)
    attachments["Newsletter#{newsletter.date}"] = open("#{newsletter.file.url}").read
    mail(
      subject: "Newsletter Available Now",
      body: "A new edition of the Here We Grow Preschool newsletter is available now."
      )
  end

  def get_user_list(announcement)
    if announcement.all_classes?
      users = User.where(active: true).pluck(:email)
    else
      users = User.where(active: true).joins(:groups).
      where(groups: { id: announcement.group_ids }).pluck(:email)      
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
