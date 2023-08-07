class DashboardController < ApplicationController
  def index
    @webhook_events = WebhookEvent.all
  end

  def send_email
    data = JSON.parse('{
      "personalizations": [
        {
          "to": [
            {
              "email": "nirmalvajaa@gmail.com"
            }
          ],
          "subject": "Sending with Twilio SendGrid is Fun"
        }
      ],
      "from": {
        "email": "nirav.darji@neosoftmail.com"
      },
      "content": [
        {
          "type": "text/html",
          "value": "<p>Hello from Twilio SendGrid!</p><p>Sending with the email service trusted by developers and marketers for <strong>time-savings</strong>, <strong>scalability</strong>, and <strong>delivery expertise</strong>.</p><p>%open-track%</p><p>Click <a href=\"https://www.google.com\">here</a> to visit the link.</p>"
        }
      ],
      "tracking_settings": {
        "click_tracking": {
          "enable": true,
          "enable_text": true
        },
        "open_tracking": {
          "enable": true,
          "substitution_tag": "%opentrack"
        },
        "subscription_tracking": {
          "enable": false
        }
      }
    }')

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._("send").post(request_body: data)

    if response.status_code == "202"
      redirect_to root_path, notice: "Your email has been sent."
    else
      redirect_to root_path, alert: "Error in sending email."
    end
  end
end