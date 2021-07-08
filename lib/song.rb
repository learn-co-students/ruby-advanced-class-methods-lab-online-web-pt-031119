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
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_number)
    song = self.new 
    song.name = song_number
    song
  end
  
  def self.create_by_name(song_number)
    song = self.new 
    song.name = song_number
    @@all << song
    song
  end
  
  def self.find_by_name(song_number)
    @@all.find{|song| song.name == song_number}
  end
  
  def self.find_or_create_by_name(song_number)
    find_by_name(song_number) || create_by_name(song_number)

    # if find_by_name(song_number) == nil
    #   create_by_name(song_number)
    # else
    #   find_by_name(song_number)
    # end
    
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
    
  end
  
  def self.new_from_filename(file_name)
    song = self.new 
    array1= file_name.split(" - ")
    song.artist_name = array1[0]
    song.name = array1[1].chomp('.mp3')
    song
 # binding.pry
    end
    
  def self.create_from_filename(file_name)
   new_song= self.new_from_filename(file_name)
   new_song.save
   end
  
  def self.destroy_all
    @@all.clear
  end

end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

