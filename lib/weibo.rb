require File.dirname(__FILE__) + '/weibo/version'

require File.dirname(__FILE__) + '/weibo/config'
require File.dirname(__FILE__) + '/weibo/oauth'
require File.dirname(__FILE__) + '/weibo/client'


if Rails
  require File.dirname(__FILE__) + '/weibo/railtie'
end
