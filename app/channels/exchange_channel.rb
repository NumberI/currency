class ExchangeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "exchange_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
