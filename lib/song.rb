require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
 

 def self.create
   song = self.new
   #song.name = song
   song.save
   song
   #binding.pry
 end

def self.new_by_name(name)
  song = self.new
   song.name = name
   song
 end



def self.create_by_name(name)
  song = self.create
  song.name = name
  song
end

def self.create_by_artist(name)
  song.artist_name = name
  song
end




def self.find_by_name(song_name)
  #inding.pry
  self.all.find do |song| 
    #binding.pry
     if song_name == song.name
        return song
      end
  end
  #binding.pry
end

def self.find_or_create_by_name(song)
  if self.find_by_name(song)
    self.find_by_name(song)
    else
  self.create_by_name(song)
  end
end
  
def self.alphabetical
  self.all.sort_by {|value| value.name}
  
  #binding.pry
end

def self.new_from_filename(song_file)
 names = song_file.split(" - ")
 #binding.pry
 song = self.new
 song.name = names[1].chomp(".mp3")
 song.artist_name = names[0]
 song
#binding.pry
end



def self.create_from_filename(song_file)
 names = song_file.split(" - ")
 #binding.pry
 song = self.create
 song.name = names[1].chomp(".mp3")
 song.artist_name = names[0]
 song
end

def self.destroy_all
  self.all.clear
  
end







  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end


