require "rails_helper"

RSpec.describe Rate do
  it "trnsfer data" do
    # @rate = Rate.create(id: 1, val: 123)
    expect{ Rate.create(id: 1, val: 123) }.to have_broadcasted_to("exchange_channel").with(a_hash_including(id: 1, val: 123))
  end  

  it "connection to exchange_channel" do
    expect{ ActionCable.server.broadcast("exchange_channel", text: 'Hello!') }.to have_broadcasted_to("exchange_channel").with(text: 'Hello!')
  end
end