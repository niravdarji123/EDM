class WebhookEvent < ApplicationRecord
  scope :delivered, -> { where(event_type: "delivered") }
  scope :opened, -> { where(event_type: "open") }
  scope :clicked, -> { where(event_type: "click") }
  scope :bounced, -> { where(event_type: "bounce") }
end
