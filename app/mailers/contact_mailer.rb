class ContactMailer < ApplicationMailer
  def contact_mail(posting_page)
    @posting_page = posting_page
    mail to: "@posting_page.user.email", subject: "投稿確認メール"
  end
end
