get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/yahoofin' do
  @ticker = params[:ticker]
  erb :results
end
