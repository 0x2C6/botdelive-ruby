class BotDelive::Base
  attr_accessor :app_id, :secret_key

  def initialize(values = {})
    @app_id = values[:app_id]
    @secret_key = values[:secret_key]
  end
end
