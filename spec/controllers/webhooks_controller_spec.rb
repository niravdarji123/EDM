require 'rails_helper'

RSpec.describe WebhooksController, type: :controller do

  describe 'POST #sendgrid_notification' do
    context 'with valid bounce event type' do
      let(:valid_json) do
        {
          "email" => "darjiniravv19@gmail.com",
          "event" => "bounce",
          "timestamp" => Time.now.to_i,
          "ip" => "127.0.0.1",
          "sg_event_id" => "event123",
          "sg_message_id" => "message123",
          "sg_content_type" => "text/html"
        }
      end

      it 'creates a new webhook event' do
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent, :count).by(1)
      end

      it 'increases the count for bounced webhook event' do
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent.bounced, :count).by(1)
      end

      it 'returns HTTP success status' do
        post :sendgrid_notification, params: { webhook: { _json: [valid_json] } }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid open event type' do
      let(:valid_json) do
        {
          "email" => "darjiniravv19@gmail.com",
          "event" => "open",
          "timestamp" => Time.now.to_i,
          "ip" => "127.0.0.1",
          "sg_event_id" => "event123",
          "sg_message_id" => "message123",
          "sg_content_type" => "text/html"
        }
      end

      it 'creates a new webhook event' do
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent, :count).by(1)
      end

      it 'increases the count for opened webhook event' do 
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent.opened, :count).by(1)
      end

      it 'returns HTTP success status' do
        post :sendgrid_notification, params: { webhook: { _json: [valid_json] } }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid click event type' do
      let(:valid_json) do
        {
          "email" => "darjiniravv19@gmail.com",
          "event" => "click",
          "timestamp" => Time.now.to_i,
          "ip" => "127.0.0.1",
          "sg_event_id" => "event123",
          "sg_message_id" => "message123",
          "sg_content_type" => "text/html"
        }
      end

      it 'creates a new webhook event' do
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent, :count).by(1)
      end

      it 'increases the count for clicked webhook event' do 
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent.clicked, :count).by(1)
      end

      it 'returns HTTP success status' do
        post :sendgrid_notification, params: { webhook: { _json: [valid_json] } }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid open event type' do
      let(:valid_json) do
        {
          "email" => "darjiniravv19@gmail.com",
          "event" => "delivered",
          "timestamp" => Time.now.to_i,
          "ip" => "127.0.0.1",
          "sg_event_id" => "event123",
          "sg_message_id" => "message123",
          "sg_content_type" => "text/html"
        }
      end

      it 'creates a new webhook event' do
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent, :count).by(1)
      end

      it 'increases the count for delivered webhook event' do 
        expect{ post :sendgrid_notification, params: { webhook: { _json: [valid_json] } } }.to change(WebhookEvent.delivered, :count).by(1)
      end

      it 'returns HTTP success status' do
        post :sendgrid_notification, params: { webhook: { _json: [valid_json] } }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid event type' do
      let(:invalid_json) do
        {
          "email" => "darjiniravv19@gmail.com",
          "event" => "unsubscribed",
          "timestamp" => Time.now.to_i,
          "ip" => "127.0.0.1",
          "sg_event_id" => "event123",
          "sg_message_id" => "message123",
          "sg_content_type" => "text/html"
        }
      end

      it 'does not create a new webhook event' do
        expect {
          post :sendgrid_notification, params: { webhook: { _json: [invalid_json] } }
        }.not_to change(WebhookEvent, :count)
      end

      it 'returns HTTP 204 status' do
        post :sendgrid_notification, params: { webhook: { _json: [invalid_json] } }
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
