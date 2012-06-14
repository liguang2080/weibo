# Weibo

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'weibo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weibo

## Usage
 #  授权:
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
    
  # 请求:
    client = Weibo::Client.new(weibo_access_token, weibo_uid)
    client.update("Hi! what are you doing!")
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
