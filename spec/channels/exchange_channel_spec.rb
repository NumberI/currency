require "rails_helper"

RSpec.describe Rate do
  let(:rate){ create(:rate) }
  
  it "trnsfer data" do
    expect{ 
      rate 
    }.to have_broadcasted_to("exchange_channel").with{ |data| 
      expect(data['content']['id']).to eq 1
    }
  end  

  it "connection to exchange_channel" do
    expect{ ActionCable.server.broadcast("exchange_channel", text: 'Hello!') }.to have_broadcasted_to("exchange_channel").with(text: 'Hello!')
  end
end