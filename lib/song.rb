require 'pry'

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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    #binding.pry
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    #binding.pry
    #create an array of only the song name strings alphabetized,
    #then sort the array of Song instances by where their respective names fall in the alphabetized song name array
    self.all.sort_by do |song|
      self.all.map {|song| song.name}.sort.index(song.name)
    end
  end

 def self.new_from_filename(filename)
   song = self.new
   #binding.pry
   song.name = filename[filename.index("-")+2...filename.index(".")]
   song.artist_name = filename[0...filename.index("-")].strip
   song
 end

#James's method below
 #  def self.new_from_filename(filename)
 #   song = self.new
 #   song.artist_name = filename.split(" - ")[0]
 #   song.name = filename.split(" - ")[1].gsub(/.mp3/, "")
 #   song
 # end

 def self.create_from_filename(filename)
   song = self.new
   song.name = filename[filename.index("-")+2...filename.index(".")]
   song.artist_name = filename[0...filename.index("-")].strip
   self.all << song
   song
 end

 def self.destroy_all
   self.all.clear
 end

end
