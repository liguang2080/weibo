require "digest/md5"
require "base64"

module Weibo
  class Oauth
    AUTHORIZE_URL = "https://api.weibo.com/oauth2/authorize"
    ACCESS_TOKEN_URL = "https://api.weibo.com/oauth2/access_token"
    API_URL = "https://api.weibo.com/2/"

    def initialize(access_token)
      @access_token = access_token
    end

    def get(path, parameters = {})
      JSON.parse RestClient.get(api_url(path), :params => parameters, :Authorization => "OAuth2 #{@access_token}")
    end

    def post(path, parameters = {})
      JSON.parse RestClient.post(api_url(path), parameters, :Authorization => "OAuth2 #{@access_token}")
    end

    def self.authorize_url
      AUTHORIZE_URL + "?client_id=#{Config.key}&redirect_uri=#{Config.redirect_uri}&response_type=code"
    end

    def self.get_access_token_by_code(code)
      response = RestClient.post(ACCESS_TOKEN_URL, :client_id => Config.key, :client_secret => Config.secret,
                                 :grant_type => "authorization_code", :code => code, :redirect_uri => Config.redirect_uri)
      JSON.parse(response)
    end

    ######################################################
    #
    # @param string $signed_request 应用框架在加载iframe时会通过向Canvas URL post的参数signed_request
    #
    #####################################################
    def self.parse_signed_request(signed_request)
      encoded_sig, payload = signed_request.split(".")
      sig = Base64.decode64_url(encoded_sig)
      begin
        data = JSON.parse(Base64.decode64_url(payload))
      rescue Exception => e
        return nil
      end
      return nil if data["algorithm"].upcase != "HMAC-SHA256"

      expected_sig = OpenSSL::HMAC.digest("sha256", Config.secret, payload)
      (sig != expected_sig) ? nil : data
    end

    private
    def api_url(path)
      path = path.gsub /^\//, ""
      path.starts_with?("http") ? (path + ".json") : "#{API_URL}#{path}.json"
    end

  end
end
