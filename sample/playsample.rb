require 'xibe'
include Xibe

class Exemplo < Application
  def initialize
    super(320,240)
    @sample = Sample.new("sample.wav")
    @sample.play
  end
end

Exemplo.new.run