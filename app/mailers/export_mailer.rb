class ExportMailer < ApplicationMailer
  def csv_email(email, csv)
    attachments["participants-#{Date.today}.csv"] = csv
    mail(to: email, subject: "CSV Export StudyDB #{Date.today}")
  end
end
