require 'json'
require 'open-uri'
require "sinatra"
require "sinatra/reloader" if development?
require "sqlite3"

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))

get "/" do
  # TODO: Gather all artists to be displayed on home page
  @names = DB.execute("SELECT name, id FROM artists").sort
  erb :home # Will render views/home.erb file (embedded in layout.erb)
end

get "/artists/:id" do
  DB.results_as_hash = false
  @albums_info = DB.execute("SELECT albums.title, albums.id FROM albums
                             JOIN artists ON artists.id = albums.artist_id
                             WHERE artist_id = ?", params[:id].to_i)
  @artist_name = DB.execute("SELECT name FROM artists
                             WHERE id = ?", params[:id].to_i).flatten[0]
  @artist_id = params[:id]
  erb :artist
end

get "/albums/:id" do
  DB.results_as_hash = false
  @tracks_info = DB.execute("SELECT tracks.name,tracks.id FROM tracks
                             JOIN albums ON albums.id = tracks.album_id
                             WHERE albums.id = ?", params[:id].to_i)
  @artist_name = DB.execute("SELECT name FROM artists
                             JOIN albums ON albums.artist_id = artists.id
                             WHERE albums.id = ?", params[:id].to_i).flatten[0]
  @album_name = DB.execute("SELECT title FROM albums WHERE id = ?", params[:id]).flatten[0]
  erb :album
end

get "/tracks/:id" do
  DB.results_as_hash = true
  @track = DB.execute("SELECT * FROM tracks WHERE id = ?", params[:id].to_i).flatten[0]

  @art_name = DB.execute("SELECT artists.name FROM artists
                   JOIN albums ON albums.artist_id = artists.id
                   JOIN tracks ON tracks.album_id = albums.id
                   WHERE tracks.id = #{params[:id]}")[0]
  erb :track
end
# Then:
# 1. Create an artist page with all the albums. Display genres as well
# 2. Create an album pages with all the tracks
# 3. Create a track page with all the track info
