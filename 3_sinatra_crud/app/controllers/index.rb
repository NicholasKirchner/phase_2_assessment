get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/notes' do
  erb :note_list
end

get '/note/:id' do
  @note = Note.find(params[:id])
  erb :note_get
end

put '/note/:id' do
  note = Note.update(params["id"], title: params["title"], 
                                   content: params["content"])
  redirect "/note/#{note.id}"
end

post '/notes' do
  note = Note.create(params)
  redirect "/note/#{note.id}"
end

delete '/delete/:id' do
  id = params["id"].to_i
  case params["confirm"]
    when "no" then redirect "/note/#{id}"
    when "maybe" then @note = Note.find(id) ; erb :delete_confirm
    when "yes" then Note.delete(id) ; redirect "/notes"
  end
end
