class CreateWebhookEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :webhook_events do |t|
      t.string :event_type
      t.string :sg_event_id
      t.string :sg_message_id
      t.string :timestamp
      t.string :ip
      t.string :sg_content_type
      t.string :email

      t.timestamps
    end
  end
end
