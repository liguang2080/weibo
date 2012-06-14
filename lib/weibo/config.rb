# -*- encoding : utf-8 -*-
require "yaml"
module Weibo
  module Config
    class << self
      attr_reader :key, :secret, :redirect_uri

      def load_config
        filename = "#{Rails.root}/config/weibo.yml"
        config = YAML.load(File.open(filename))[Rails.env]
        @key, @secret, @redirect_uri = config['key'], config['secret'], config['redirect_uri']
        raise "Please configure your Weibo config in #{filename}." unless @key && @secret && @redirect_uri
      end
    end
  end
end

Weibo::Config.load_config
