require 'bot_delive/version'
require 'bot_delive/configuration'
require 'bot_delive/request'
require 'bot_delive/error'
require 'active_support/core_ext/string/inflections'

module BotDelive
  extend Configuration

  [:verify, :auth, :push].each do |method_name|
    define_singleton_method method_name do |options = {}|
      raise BotDelive::Error::NullCredentialsError.new('app_id or secret_key is not defined') unless self.config
      options[:app_id] = self.config.app_id
      options[:secret_key] = self.config.secret_key
      BotDelive::Request.send(method_name, options)
    end
  end
end

class Hash
  def success?
    return self["success"]
  end

  def method_missing(m, *args, &block)
    return self["#{m}".camelize(:lower)]
  end
end
