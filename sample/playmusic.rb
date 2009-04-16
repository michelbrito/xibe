require 'xibe'
include Xibe

class Exemplo < Application
  def initialize
    super(320,240)
    @music = Music.new("song.mid")
    @music.play
  end
end

Exemplo.new.run