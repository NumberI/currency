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

  validates :val, presence: true
  validate :future

  
  after_commit :send_broadcast

  def self.new_rate
    date = rand(0..20).days.ago.strftime("%d/%m/%Y")
    xml = open("https://www.cbr.ru/scripts/XML_daily.asp?date_req=#{date}").read
    cur = Hash.from_xml(xml, ['integer'])
    @date = cur["ValCurs"]["Date"]
    @dollar = cur["ValCurs"]["Valute"].detect{|h| h["Name"] == "Доллар США"}
    # Rate.upsert(id: 1, name: @dollar["Name"], val: @dollar["Value"], created_at: Time.now, updated_at: Time.now)
    Rate.find_or_initialize_by(:id => 1).update(name: @dollar["Name"], val: @dollar["Value"].gsub(',','.'))
  end

  private
  def send_broadcast
    p "test b"
    rate_admin = Rate.find(2)
    if !rate_admin.nil? && Time.now < rate_admin[:fixed_till]
      ActionCable.server.broadcast "exchange_channel", content: rate_admin
    else
      rate = Rate.find(1)
      ActionCable.server.broadcast "exchange_channel", content: rate
    end
  end

  def future
    errors.add(:fixed_till, "Can't be in the past!") if fixed_till < Time.now
  end
end
