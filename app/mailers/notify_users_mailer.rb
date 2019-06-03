class NotifyUsersMailer < ApplicationMailer
  def send_email(email, ids)
    @resources = Resource.find(ids)
    mail(to: email,
         subject: 'New resource')
  end
end
