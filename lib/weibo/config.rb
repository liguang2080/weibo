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
        raise "" unless @key && @secret && @redirect_uri
        
      rescue Exception => e
        puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts "|"
        puts "Please configure weibo key secret redirect_uri in #{filename}."
        puts "|"
        puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      end
    end
  end
end