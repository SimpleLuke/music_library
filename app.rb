# file: app.rb
require_relative 'lib/database_connection'
require_relative './lib/artist_repository'
require_relative './lib/album_repository.rb'
# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
  p artist
end

album_repository = AlbumRepository.new

album_repository.all.each do |album|
  p album
end
