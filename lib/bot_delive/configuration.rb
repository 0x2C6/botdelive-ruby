require 'bot_delive/base'

module BotDelive::Configuration
  def configure
    @config = BotDelive::Base.new
    yield @config if block_given?
  end

  def config
    @config if @config
  end
end
