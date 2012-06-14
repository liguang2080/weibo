module Weibo
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      Weibo::Config.load_config
    end
  end
end
