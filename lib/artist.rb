require 'pry'
class Artist
  attr_accessor :name, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    self.song = song
    @songs << song
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    self.all.detect {|artist| artist.name == name} || self.new(name)
  end

  def print_songs
    self.songs.each {|song| puts song.instance_variable_get(:@name)}
  end

end
