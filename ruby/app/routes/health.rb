

class HealthRoutes < Sinatra::Base
  #I will usually check if the token is correct but I have no user in db to check that
  get('/') do
    if !request.env['HTTP_AUTHORIZATION'].empty?
      decoded_string = Base64.decode64(request.env['HTTP_AUTHORIZATION'][6..]).force_encoding('UTF-8').split(':', 2)
      if !decoded_string[0].eql?("applicant") || ! decoded_string[1].eql?("pass")
        status 403
      else
        'App working OK'
      end

    else
      status 403
    end
  end
end
