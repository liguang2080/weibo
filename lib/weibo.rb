require File.expand_path(File.dirname(__FILE__) + '/weibo/version')

require File.expand_path(File.dirname(__FILE__) + '/weibo/config')
require File.expand_path(File.dirname(__FILE__) + '/weibo/oauth')
require File.expand_path(File.dirname(__FILE__) + '/weibo/client')

if defined?(Rails)
  require File.expand_path(File.dirname(__FILE__) + '/weibo/railtie')
end

