require 'twilio-ruby'
require 'sinatra'
require 'pry-nav'
require 'pry'
class TwilioController < ApplicationController

  include Webhookable
  after_filter :set_header

  skip_before_action :verify_authenticity_token
  account_sid = ''
  auth_token = ''

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

 def process_sms
   # Do something with params['From'] -- contains the phone number the SMS came from
   # Do something with params['Body'] -- contains the text sent in the SMS

   # <Reponse/> is the minimum to indicate a "no response" from Twilio
   @city = params[:FromCity].capitalize
   @state = params[:FromState]
   render 'process_sms.xml.erb', :content_type => 'text/xml'
 end
end
