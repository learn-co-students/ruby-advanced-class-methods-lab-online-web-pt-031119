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
    song=self.new
    song.save
    song
  end
  
  def self.new_by_name(songName)
    song=self.new
    song.name = songName
    song
  end

  def self.create_by_name(songName)
    song=self.new
    song.name=songName
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
    
  end

  def self.find_or_create_by_name(songName)
    self.find_by_name(songName) || self.create_by_name(songName)
    
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
    
  end

  def self.new_from_filename(filename)
    separated = filename.split(' - ')
    artist = separated[0]
    songTitle = separated[1].gsub(/.mp3/, '')
    song = self.create
    song.name = songTitle
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    separated = filename.split(' - ')
    artist = separated[0]
    songTitle = separated[1].gsub(/.mp3/, '')
    song = self.create
    song.name = songTitle
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
