require "rails_helper"

RSpec.describe Rate do
  it "trnsfer data" do
    @rate = Rate.create(id: 1, val: 123)
    expect { @rate }.to have_broadcasted_to("exchange_channel").with(id: 1, val: 123)
  end
end