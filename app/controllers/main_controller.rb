require 'open-uri'
require 'rexml/document'

class MainController < ApplicationController


  def root
    Rate.find(2)[:fixed_till] > Time.now ? @dollar = Rate.find(2) : @dollar = Rate.find(1)
  end
end
