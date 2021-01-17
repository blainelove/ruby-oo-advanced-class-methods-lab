require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song

  end
  
  def self.new_by_name(new_name)
    my_song = self.create
    my_song.name = new_name
    my_song
  end

  def self.create_by_name(new_name)
   self.new_by_name(new_name)
  end

  def self.find_by_name(new_name)
    self.all.find{ |i| i.name == new_name}
  
  end

  def self.find_or_create_by_name(new_name)
    match = self.find_by_name(new_name)
    if match
      match 
    else
      self.create_by_name(new_name)
    end
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    b = filename.split(" - ")
    artist_name = b[0]
    v = b[1].split(".mp3")
    name = v[0]
    song = Song.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end


