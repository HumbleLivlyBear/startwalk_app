class PagesController < ApplicationController
  
  before_filter :session_url, :except => [:login]
  
  SITE_URL="http://localhost:3000/"
  
  
  def session_url
    session[:current_url] = request.url
  end
  def login
     # test = request.url
    #Rails.logger.info("XXXXXXXXXXXXXXXXXXXXXX     #{session[:current_url]}")
    @oauth = Koala::Facebook::OAuth.new("295205770520844", "a0aa290ff9019b2acb2250be19998936", session[:current_url])
    facebook_auth_url = @oauth.url_for_oauth_code
    redirect_to facebook_auth_url
  end
  
  
  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
    
    if params[:code].present?
      #Rails.logger.info"xxxxxxxxxxxxxxxx    #{session[:current_url][0..session[:current_url].index("?")-1]}"
      @oauth = Koala::Facebook::OAuth.new("295205770520844", "a0aa290ff9019b2acb2250be19998936", session[:current_url][0..session[:current_url].index("?")-1])
      access_token = @oauth.get_access_token(params[:code])
      @graph = Koala::Facebook::API.new(access_token)
      @profile = @graph.get_object("me")
    end
    
    
    
    @test = @profile
    
    if !Member.all.empty?
    @projects = Member.find(1).projects
    end
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show
    if params[:code].present?
      @oauth = Koala::Facebook::OAuth.new("295205770520844", "a0aa290ff9019b2acb2250be19998936", session[:current_url])
      access_token = @oauth.get_access_token(params[:code])
      @graph = Koala::Facebook::API.new(access_token)
      @profile = @graph.get_object("me")
    end
    
    
    @page = Page.find("#{params[:path]}/#{params[:id]}".split('/').last)

    if @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').live.first).present?
        redirect_to first_live_child.url and return
      elsif @page.link_url.present?
        redirect_to @page.link_url and return
      end
    else
      error_404
    end
  end

end
