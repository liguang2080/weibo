require "rest-client"

module Weibo
  class Client
    attr_reader :oauth

    def initialize(access_token, weibo_uid = nil)
      @oauth = Oauth.new(access_token)
      @weibo_uid = weibo_uid
    end

    ################# 微博接口

    def statuses_update(status, options = {})
      self.oauth.post "statuses/update", :status  => status
    end

    def statuses_upload(status, pic_path, options = {})
      self.oauth.post 'statuses/upload', :status => status, :pic => File.new(File.expand_path(pic_path))
    end
    
    def statuses_upload_url_text(status, url, options = {})
      default_params = { :status => status, :url => url }
      self.oauth.post 'statuses/upload_url_text', default_params.merge(options)
    end

    def statuses_show(status_id, options = {})
      self.oauth.get "statuses/show", :id => status_id
    end

    def statuses_user_timeline(options = {})
      default_params = { :uid => @weibo_uid }
      self.oauth.get "statuses/user_timeline", default_params.merge(options)
    end

    def statuses_querymid(id, options = {})
      default_params = { :id => id, :type => 1 }
      self.oauth.get "statuses/querymid", default_params.merge(options)
    end

    def statuses_queryid(mid, options = {})
      default_params = { :mid => mid, :type => 1, :isBase62 => 1 }
      self.oauth.get "statuses/queryid", default_params.merge(options)
    end
    
    def statuses_repost_by_me(options = {})
      self.oauth.get "statuses/repost_by_me", options
    end
    
    def statuses_repost(status_id, options = {})
      default_params = { :id => status_id }
      self.oauth.post 'statuses/repost', default_params.merge(options)
    end

#==============add by yu xiao dan start 2012-10-17
    def statuses_mentions(options = {})
      self.oauth.post 'statuses/mentions', options
    end
#==============add by yu xiao dan end

    ################# 关系接口

    def friendships_followers(options = {})
      default_params = { :cursor => 0, :count => 200, :uid => @weibo_uid }
      self.oauth.get "friendships/followers", default_params.merge(options)
    end

    def friendships_friends(options = {})
      default_params = { :cursor => 0, :count => 200, :uid => @weibo_uid }
      self.oauth.get "friendships/friends", default_params.merge(options)
    end

    def friendships_friends_bilateral(uid, options = {})
      default_params = { :page => 1, :count => 50, :sort => 0 }
      self.oauth.get "friendships/friends/bilateral", default_params.merge(options)
    end

    def friendships_create(uid)
      self.oauth.post("friendships/create", :uid  => uid)
    end

    


    #################  用户接口

    def users_show(options = {})
      default_params = { :uid => @weibo_uid }
      self.oauth.get "users/show", default_params.merge(options)
    end


    #################  标签

    def tags(options = {})
      default_params = { :uid => @weibo_uid }
      self.oauth.get "tags",default_params.merge(options)
    end


    # 1.0接口
    def app_send(uids, title, content)
      self.oauth.post("https://api.t.sina.com.cn/notice/app/send", :uids  => uids.join(","), :title => title, :content => content)
    end
  end
end
