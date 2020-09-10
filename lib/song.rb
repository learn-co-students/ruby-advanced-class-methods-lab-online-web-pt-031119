# class Song
#   attr_accessor :name, :artist_name
#   @@all = []

# def song.create
#   song = song.create
# end 

# def initiate
# end 

#   def self.all
#     @@all
#   end

#   def save
#     self.class.all << self
#   end

# end

class Song
  
	attr_accessor :name, :artist_name
  
	@@all = []

	def song.create
  
	song = song.create

	song.save
	song
	end

	def initialize
	self 
	@@all << self 
 
	end 

  def self.all
    
	@@all
  
	end

  def save
    
	self.class.all << self
  
	end



	def self.finds_by_name(name) # Class finder
	#where do I look to find songs?
	#wherever Im looking for songs how do songs get there
	#whose responisibility is it to keep track of songs? 
	#I need to go through @@all and find the 
	#song that matches the string provided in this method 
	
	result = nil	
	@@all.each do |song|
	result = song if song.name == name 
	end 
		
	song.find_all{|i| i == name}
	result 
	end  

	def self.destroy_all!
	@@all.clear
	end 

end
