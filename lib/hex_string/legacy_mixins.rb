require 'hex_string'

module HexString
  
  module LegacyMixins
    def to_byte_string
      HexString.pack(self)
    end

    def to_hex_string(readable = true)
      HexString.unpack(self, readable)
    end
  end
end

