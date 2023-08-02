class WebhooksController < ApplicationController
  def sendgrid_notification
    json = params["webhook"]["_json"][0]

    email = json["email"]
    event = json["event"]
    timestamp = json["timestamp"]
    ip = json["ip"]
    sg_event_id = json["sg_event_id"]
    sg_message_id = json["sg_message_id"]
    sg_content_type = json["sg_content_type"]

    if ['bounce', 'open', 'delivered', 'click'].include?(event)
      event_count = WebhookEvent.new(
        event_type: event,
        email: email,
        sg_message_id: sg_message_id,
        ip: ip,
        sg_event_id: sg_event_id,
        timestamp: timestamp,
        sg_content_type: sg_content_type,
      )
      event_count.save

      head :ok
    end
  end
end