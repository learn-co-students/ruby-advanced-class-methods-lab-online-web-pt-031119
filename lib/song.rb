require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    @@all << self.new
    @@all[@@all.size - 1]
  end
  
  def self.new_by_name (title)
    song = self.new
    song.name = title
    song
  end
  
  def Song.create_by_name (song)
    new_song = self.new
    new_song.name = song
    @@all << new_song
    new_song
  end
  
  def Song.find_by_name (song)
    @@all.find do |songs|
    songs.name == song
  end

end

  def Song.find_or_create_by_name (song)
      if Song.find_by_name(song).name == song
        song
      else
        Song.create_by_name (song)
      end
end
end
