# file: app.rb
require_relative 'lib/database_connection'
require_relative './lib/artist_repository'
require_relative './lib/album_repository.rb'
# We need to give the database name to the method `connect`.
# DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .

# artist_repository = ArtistRepository.new
#
# artist_repository.all.each do |artist|
#   p artist
# end
#
# album_repository = AlbumRepository.new
#
# album_repository.all.each do |album|
#   p album
# end
#
# album = album_repository.find(1)
# p album.id
# p album.title
# p album.release_year
# p album.artist_id
# Welcome to the music library manager!
#
# What would you like to do?
#  1 - List all albums
#  2 - List all artists
#
# Enter your choice: 1
# [ENTER]
#
# Here is the list of albums:
#  * 1 - Doolittle
#  * 2 - Surfer Rosa
#  * 3 - Waterloo
#  * 4 - Super Trouper
#  * 5 - Bossanova
#  * 6 - Lover
#  * 7 - Folklore
#  * 8 - I Put a Spell on You
#  * 9 - Baltimore
#  * 10 -	Here Comes the Sun
#  * 11 - Fodder on My Wings
#  * 12 -	Ring Ring

class Application
  def initialize(database_name,io,album_repository,artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts 'Welcome to the music library manager!'
    @io.puts "\n"
    @io.puts 'What would you like to do?'
    @io.puts '  1 - List all albums'
    @io.puts '  2 - List all artists'
    @io.puts "\n"
    @io.print 'Enter your choice: '
    choice = @io.gets.chomp

    @io.puts "\n"

    if choice == '1'
      @io.puts 'Here is the list of albums:'

      @album_repository.all.each do |album|
        @io.puts " * #{album.id} - #{album.title}"
      end
    else
      @io.puts 'Here is the list of artist:'

      @artist_repository.all.each do |artist|
        @io.puts " * #{artist.id} - #{artist.name}"
      end
    end

  end
end

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end
