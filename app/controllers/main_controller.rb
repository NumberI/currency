require 'open-uri'
require 'rexml/document'

class MainController < ApplicationController
  def root
    # http = Net::HTTP.new("http://www.cbr.ru")
    xml = open("https://www.cbr.ru/scripts/XML_daily.asp?date_req=24/09/2019").read
    cur = Hash.from_xml(xml, ['integer'])
    @date = cur["ValCurs"]["Date"]
    @dollar = cur["ValCurs"]["Valute"].detect{|h| h["Name"] == "Доллар США"}
  end
end
