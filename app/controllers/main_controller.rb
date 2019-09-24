require 'open-uri'
require 'rexml/document'

class MainController < ApplicationController


  def root
    # http = Net::HTTP.new("http://www.cbr.ru")
    date = rand(0..20).days.ago.strftime("%d/%m/%Y")
    xml = open("http://212.40.192.49/scripts/XML_daily.asp?date_req=#{date}").read
    # xml = open("https://www.cbr.ru/scripts/XML_daily.asp?date_req=24/09/2019").read
    cur = Hash.from_xml(xml, ['integer'])
    @date = cur["ValCurs"]["Date"]
    @dollar = cur["ValCurs"]["Valute"].detect{|h| h["Name"] == "Доллар США"}
    
    respond_to do |format|
      format.html 
      format.json { render json: @dollar }
    end
  end
end
