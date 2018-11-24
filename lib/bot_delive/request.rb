require 'json'
require 'rest-client'

module BotDelive::Request
  BASE_API_URL = "https://botdelive.com/api"
  VERIFY_URL = "#{BASE_API_URL}/verifyAC"
  AUTH_URL = "#{BASE_API_URL}/sendAuth"
  PUSH_URL = "#{BASE_API_URL}/sendPush"

  class << self
    [:verify, :auth, :push].each do |method_name|
      define_method method_name do |options|
        properties = Hash.new
        properties["appId"] = options[:app_id]
        properties["secretKey"] = options[:secret_key]
        properties["accessCode"] = options[:access_code]
        properties["userId"] = options[:user_id]
        properties["message"] = options[:message]
        response = RestClient.get Object.const_get("BotDelive::Request::#{method_name.upcase}_URL"),
         {params: properties}
        return JSON.parse(response)
      end
    end
  end
end
