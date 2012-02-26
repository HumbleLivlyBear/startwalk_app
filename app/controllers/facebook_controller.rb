class FacebookController < ApplicationController
  
  SITE_URL="http://localhost:3000/"
  
  def login
    @oauth = Koala::Facebook::OAuth.new("295205770520844", "a0aa290ff9019b2acb2250be19998936", SITE_URL+'facebook/test')
    facebook_auth_url = @oauth.url_for_oauth_code
    redirect_to facebook_auth_url
  end
  
  def test
    @oauth = Koala::Facebook::OAuth.new("295205770520844", "a0aa290ff9019b2acb2250be19998936", SITE_URL+'facebook/test')
    access_token = @oauth.get_access_token(params[:code])
    @graph = Koala::Facebook::API.new(access_token)
    @profile = @graph.get_object("me")
  end
  
end
