# -*- encoding : utf-8 -*-
module Weibo
  class Railtie < ::Rails::Railtie
    initializer "加载rails环境下的config" do
      Weibo::Config.load_config
    end
  end
end
