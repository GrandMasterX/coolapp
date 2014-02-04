class Tracks < ActiveRecord::Migration
  def change
  	create_table :tracks do |t|
        t.string  'title'
        t.string  'genre'
        t.string  'file'
        t.string  'cover'
        t.integer 'album_id'
        t.timestamp 'releaseDate'
    end
  end
end
