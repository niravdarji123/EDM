class WebhooksController < ApplicationController
  def sendgrid_notification
    json = params.dig("webhook", "_json", 0)

    return head :bad_request if json.blank?

    if %w[bounce open delivered click].include?(event)
      event_count = WebhookEvent.create(
        event_type: json["event"],
        email: json["email"],
        sg_message_id: json["sg_message_id"],
        ip: json["ip"],
        sg_event_id: json["sg_event_id"],
        timestamp: json["timestamp"],
        sg_content_type: json["sg_content_type"]
      )

      if event_count.persisted?
        head :ok
      else
        head :unprocessable_entity
      end
    else
      head :bad_request
    end
  end
end