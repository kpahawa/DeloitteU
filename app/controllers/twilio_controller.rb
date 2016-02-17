require 'twilio-ruby'
require 'sinatra'
require 'pry-nav'
require 'pry'
class TwilioController < ApplicationController

  include Webhookable
  after_filter :set_header

  skip_before_action :verify_authenticity_token
  account_sid = 'AC3ca02afa67ad901413bd92f9c366bc0b'
  auth_token = '38e79147f091e0a116b9d261794112fb'

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
