require 'open-uri'
require 'rexml/document'

class MainController < ApplicationController


  def root
    # http = Net::HTTP.new("http://www.cbr.ru")
    @dollar = Rate.find(1)
    # @date = cur["ValCurs"]["Date"]
        
    respond_to do |format|
      format.html 
      format.json { render json: @dollar }
    end
    # ActionCable.server.broadcast "exchange_channel", content: @dollar

  end
end
