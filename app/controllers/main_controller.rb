require 'open-uri'
require 'rexml/document'

class MainController < ApplicationController
  def root
    # http = Net::HTTP.new("http://www.cbr.ru")
    xml = open("http://www.cbr.ru/scripts/XML_daily.asp?date_req=20/09/2019").read
    @cur = Hash.from_xml(xml, ['integer'])
  end
end
