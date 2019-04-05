require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
   def self.create
    song = self.new
    @@all << song
    song
  end
  
    def self.new_by_name(song_name)
    song = self.new 
    @@all << song 
    song.name = song_name
     song
  end 
  
    def self.create_by_name(song_name)
      song = self.new 
      @@all << song 
      name = song 
      song.name = song_name 
      song
  end 
  
     def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end



    def self.find_or_create_by_name(name)
      if self.find_by_name(name) 
        @@all.find do |song| 
            song.name == name 
              song 
          end 
      else 
        create_by_name(name)
    end 
  end 
  
    
    def self.alphabetical
    @@all.sort_by {|x|x.name}
   end 
   

   def self.new_from_filename(filename)
      rows = filename.split(" - ")
    
      artist = rows[0]
      title = rows[1].split(".mp3")[0]
      
        song = self.new 
        song.artist_name = artist
        song.name = title
    song 
  end 
  
 def self.create_from_filename(filename)
      rows = filename.split(" - ")
    
      artist = rows[0]
      title = rows[1].split(".mp3")[0]
      
        song = self.create
        song.artist_name = artist
        song.name = title
    song 
  end 
  
  
  
    

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  

def self.destroy_all 
  self.all.clear
end 


end
