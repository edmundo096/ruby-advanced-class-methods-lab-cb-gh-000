class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save # same as @@all << new_song, or self.all << new_song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    # Same as
    #song = self.new_by_name
    #song.save
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song = self.create_by_name(name) if song == nil
    song
  end

  def self.alphabetical
    @@all.sort {|song_a, song_b| song_a.name <=> song_b.name}
  end

  def self.new_from_filename(filename)
    result = filename.split(/(?: - )|\./)
    song = self.new
    song.artist_name = result[0]
    song.name = result[1]
    song
  end

  def self.create_from_filename (filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    self.class.all << self
  end

end
