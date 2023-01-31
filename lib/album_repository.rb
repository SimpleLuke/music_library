require_relative './album'

class AlbumRepository
  def all
    # SELECT * FROM albums;
    #
    # Returns an array of Album objects.
    albums = []
    sql = 'SELECT * FROM albums;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end

    return albums
  end

  def find(id)
    sql = 'SELECT * FROM albums WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql,params)

    record = result[0]

    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']

    # p album

    return album 
  end

  def create(album)
    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
    params = [album.title, album.release_year, album.artist_id]

    DatabaseConnection.exec_params(sql,params)
    
    return nil
    
  end
end
