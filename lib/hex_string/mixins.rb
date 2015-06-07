require 'hex_string'

module HexString
  module Mixins
    def pack_to_byte_string
      HexString.pack(self)
    end

    def unpack_to_hex_string(readable = true)
      HexString.unpack(self, readable)
    end
  end
end

