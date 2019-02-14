class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def genres
    @songs.collect {|s| s.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end
end
