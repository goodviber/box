require "httparty"

class ApiCaller

  def initialize(username)
    @username = username
  end

  def api_call
    response = HTTParty.get("https://api.github.com/users/#{@username}/repos")

    case response.code
    when 404
      raise 'Username not found'
    else
      response
    end

  end
end
