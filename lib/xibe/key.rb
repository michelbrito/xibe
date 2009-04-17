# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe

  class Key
    include SDL::Key
    def self.scan
      SDL::Key.scan
    end

    def self.press?(key)
      SDL::Key.press?(key)
    end

    def self.mod_state
      SDL::Key.mod_state
    end

    def self.name(key)
      SDL::Key.get_key_name(key)
    end

    def self.enable_key_repeat(delay,interval)
      SDL::Key.enable_key_repeat(delay,interval)
    end

    def self.disable_key_repeat
      SDL::Key.disable_key_repeat
    end    
  end
  
end
