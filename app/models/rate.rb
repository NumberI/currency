class Rate < ApplicationRecord
  def self.new_rate
    date = rand(0..20).days.ago.strftime("%d/%m/%Y")
    xml = open("https://www.cbr.ru/scripts/XML_daily.asp?date_req=#{date}").read
    # xml = open("https://www.cbr.ru/scripts/XML_daily.asp?date_req=24/09/2019").read
    cur = Hash.from_xml(xml, ['integer'])
    @date = cur["ValCurs"]["Date"]
    @dollar = cur["ValCurs"]["Valute"].detect{|h| h["Name"] == "Доллар США"}
  end
end
