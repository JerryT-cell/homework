class HealthRoutes < Sinatra::Base
  #I will usually check if the token is correct but I have no user in db to check that
  get('/') do
    if !request.env['HTTP_AUTHORIZATION'].empty?
      'App working OK'
    else
      status 403
    end
  end
end
