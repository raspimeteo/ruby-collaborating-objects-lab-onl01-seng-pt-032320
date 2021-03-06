require 'pry'
class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name)
      @name = name
      save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.new_by_filename(filename)

        song_name = filename.split(" - ")[1]
        artist_name=( filename.split(" - ")[0])
        song = self.new(song_name)
        artist = Artist.find_or_create_by_name(artist_name)
        # binding.pry
        artist.add_song(song)
        song.artist = artist
        song
    end

    def artist_name= (artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end

  end
