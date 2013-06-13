get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = nil
  erb :event_new
end

post '/events/create' do
  @event = Event.new(params)
  if @event.valid? 
    @event.save
    redirect "/"
  else
    (erb :event_new)
  end
end

def print_errors
  @event ? :_errors : :_null_partial
end

def fill_value(field)
  @event ? @event.send(field) : (erb :_null_partial)
end
