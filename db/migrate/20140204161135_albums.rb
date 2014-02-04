class Albums < ActiveRecord::Migration
  def change
  	create_table :albums do |t|
        t.string 'title'
        t.string 'cover'
        t.integer 'user_id'
        t.timestamp 'releaseDate'
    end
  end
end
