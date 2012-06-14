# Weibo

  新浪微博开放平台新版接口sdk 支持站外与站内应用 oauth2

## 安装

Add this line to your application's Gemfile:

    gem 'weibo', :git => "git://github.com/lg2046/weibo.git"

And then execute:

    $ bundle
    
## 使用

 授权:
 
    站外应用:
    
    class WeiboController < ApplicationController
      def connect
        redirect_to Weibo::Oauth.authorize_url
      end

      def callback
        access_token = Weibo::Oauth.get_access_token_by_code(params[:code])
        render :text => access_token.inspect
      end
    end
    
    站内应用:
    
    access_token = Weibo::Oauth.parse_signed_request(signed_request) #返回加密前的数据
    
  rest api 请求:
  
    client = Weibo::Client.new(weibo_access_token, weibo_uid)
    client.update("Hi! what are you doing!")
    client.upload("Hi! what are you doing!", pic_path)
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
