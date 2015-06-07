# HexString.pack converts a human-readable string of ascii hex tuples into an 8-bit binary represetnation.
#
# HexString.unpack converts a string of binary data into a human-readable string of hex tuples.
#
# require 'hex_string/mixins' for a mixable module that adds #pack_to_byte_string and #unpack_to_hex_string to a String-like class or instance of your choosing.
#
# require 'hex_string/string_mixins' to automatically mix #pack_to_byte_string and #unpack_to_hex_string into the String class globally.
#
# require 'hex_string/legacy_string_mixins' to retain backward compatibility with code that may have used older versions of HexString... its mixin methods are named #to_byte_string and #to_hex_string.
#
module HexString
  # Convert a human-readable hex string into binary data.
  #
  # Assumes the target String is an ASCII, human readable sequence of hexadecimal 
  # tuples depicting a sequence of 8-bit byte values.
  # Whitespace between tuples is allowed and will be removed before packing.
  #
  # Returns a newly created string containing binary data -- the target string will not be modified.
  #
  # Eg:
  #   >> HexString.pack("68 65 6c 6c 6f")
  #   => "hello"
  def self.pack(hex_string)
    stripped = hex_string.gsub(/\s+/,'')
    unless stripped.size % 2 == 0
      raise "Can't pack a hex string into a byte string unless it has an even number of digits"
    end
    raise "Can't pack a hex string containing non-hex characters" if stripped =~ /[^0-9A-Fa-f]/
    res = [stripped].pack('H*')
    if RUBY_VERSION =~ /1.8/
      res
    else
      res.force_encoding("ascii-8bit")
    end
  end

  # Convert binary data into a human-readable hex string.
  #
  # Whatever data is contained in the target string will be "exploded" into a sequence of 
  # hexadecimal tuples, one space between each tuple, for ease of debugging and reading.
  # 
  # Returns a newly created string containing the hex string -- the target binary string will not be modified.
  #
  # Eg:
  #   >> HexString.unpack("hello world")
  #   => "68 65 6c 6c 6f 20 77 6f 72 6c 64"
  def self.unpack(byte_string, readable = true)
    unpacked = byte_string.unpack('H*').first
    if readable
      unpacked.gsub(/(..)/,'\1 ').rstrip
    else
      unpacked
    end
  end
end
