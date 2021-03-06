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
   song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
  end

    def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

 def self.new_from_filename(name)
    array = name.split(" - ")
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    array = name.split(" - ")
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end



  def self.destroy_all
    @@all = @@all.clear
  end

end
