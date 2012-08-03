# -*- encoding : utf-8 -*-
require "yaml"

module Weibo
  module Config

    class << self
      attr_reader :app_key, :app_secret, :redirect_uri

      def load_config
        filename = "#{Rails.root}/config/weibo.yml"
        config = YAML.load(File.open(filename))[Rails.env]
        @app_key, @app_secret, @redirect_uri = config['app_key'], config['app_secret'], config['redirect_uri']
        unless @app_key && @app_secret && @redirect_uri
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          puts "|"
          puts "Please configure weibo app_key app_secret redirect_uri in #{filename}."
          puts "|"
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        end
      end

      def temp_change_config(config)
        o_app_key, o_app_secret, o_redirect_url = @app_key, @app_secret, @redirect_uri
        @app_key, @app_secret, @redirect_uri = config.app_key, config.app_secret, config.redirect_uri
        result = yield
        @app_key, @app_secret, @redirect_uri = o_app_key, o_app_secret, o_redirect_url
        result
      end
    end


  end
end
