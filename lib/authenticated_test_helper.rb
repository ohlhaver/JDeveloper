module AuthenticatedTestHelper
  # Sets the current developer in the session from the developer fixtures.
  def login_as(developer)
    @request.session[:developer_id] = developer ? (developer.is_a?(Developer) ? developer.id : developers(developer).id) : nil
  end

  def authorize_as(developer)
    @request.env["HTTP_AUTHORIZATION"] = developer ? ActionController::HttpAuthentication::Basic.encode_credentials(developers(developer).login, 'monkey') : nil
  end
  
end
