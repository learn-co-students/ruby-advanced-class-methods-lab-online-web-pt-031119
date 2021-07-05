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
    song = self.new #When a new song is instantiated it sets it equal to new_song. Then we just return new_song. 
    @@all << song #puts all new_songs in the class variable 
    song #returns the new_song 
    #binding.pry 
  end
  
  def self.new_by_name(name) #This method has a property of name. 
    song = self.new
    song.name = name 
    song
    #binding.pry 
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song 
    song
    #binding.pry 
  end 
  
  def self.find_by_name(name)
    @@all.each.find do |song| #iterates through the class variable and returns false if the song name isnt present
      song.name == name
      #binding.pry 
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical()
    self.all.sort_by{|song| song.name}
      #binding.pry 
  end
  
  def self.new_from_filename(filename)
    title = filename.split(" - ") #removes the (-) from the filename 
    artist = title[0] # first string in the array after the split 
    song_name, extension = title[1].split(".") #title[1] includes the string and extention. This splits that and makes the extension
    #its own string. now we have 2 strings in the array here. 
    song = self.new #instantiated song 
    song.artist_name = artist #sets artist_name (accessible through the attr_accessor)
    song.name = song_name #sets name of song (accessible through the attr_accessor)
    song #returns @artist_name and @name that we set 
    #binding.pry 
  end
  
  #Very similar to above 
  def self.create_from_filename(filename)
    title = filename.split(" - ")
    artist = title[0]
    song_name, extension = title[1].split(".")
    song = self.create #sets song to what ever .create method is.
    song.artist_name = artist 
    song.name = song_name 
    song 
    #binding.pry 
  end
  
  def self.destroy_all 
    self.all.clear #clears all the songs from our class variable 
  end 

end
