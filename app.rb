require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')

get('/') do
  erb(:index)
end

get('/dealerships/new') do
  erb(:dealerships_form)
end

get('/dealerships') do
  erb(:dealerships)
end
