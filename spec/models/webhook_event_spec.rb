require 'rails_helper'

RSpec.describe WebhookEvent, type: :model do
  describe "scopes" do
    it "returns delivered webhook events" do
      delivered_webhook_event = WebhookEvent.create(event_type: "delivered")

      expect(WebhookEvent.delivered).to match_array(delivered_webhook_event)
    end

    it "returns opened webhook events" do
      opened_webhook_event = WebhookEvent.create(event_type: "open")

      expect(WebhookEvent.opened).to match_array(opened_webhook_event)
    end

    it "returns delivered webhook events" do
      clicked_webhook_event = WebhookEvent.create(event_type: "click")

      expect(WebhookEvent.clicked).to match_array(clicked_webhook_event)
    end

    it "returns delivered webhook events" do
      bounced_webhook_event = WebhookEvent.create(event_type: "bounce")

      expect(WebhookEvent.bounced).to match_array(bounced_webhook_event)
    end
  end
end
