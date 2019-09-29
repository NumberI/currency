# == Schema Information
#
# Table name: rates
#
#  id         :bigint           not null, primary key
#  name       :string
#  val        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rate < ApplicationRecord
  require 'open-uri'
  require 'rexml/document'
  
  after_commit :send_broadcast

  def self.new_rate
    date = rand(0..20).days.ago.strftime("%d/%m/%Y")
    xml = open("https://www.cbr.ru/scripts/XML_daily.asp?date_req=#{date}").read
    # xml = open("https://www.cbr.ru/scripts/XML_daily.asp?date_req=24/09/2019").read
    cur = Hash.from_xml(xml, ['integer'])
    @date = cur["ValCurs"]["Date"]
    @dollar = cur["ValCurs"]["Valute"].detect{|h| h["Name"] == "Доллар США"}
    # Rate.upsert(id: 1, name: @dollar["Name"], val: @dollar["Value"], created_at: Time.now, updated_at: Time.now)
    Rate.find_or_initialize_by(:id => 1).update(name: @dollar["Name"], val: @dollar["Value"], created_at: Time.now, updated_at: Time.now)
  end

  private
  def send_broadcast
    p "test b"
    rate = Rate.find(1)
    ActionCable.server.broadcast "exchange_channel", content: rate
  end
end
