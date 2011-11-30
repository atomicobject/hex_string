# String extensions providing to_hex_string and to_byte_string.
# Requiring hex_string will automatically include HexString in the String class.
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
  #   >> "68 65 6c 6c 6f".to\_byte\_string
  #   => "hello"
	def to_byte_string
		stripped = self.gsub(/\s+/,'')
		unless stripped.size % 2 == 0
			raise "Can't translate a string unless it has an even number of digits"
		end
    raise "Can't translate non-hex characters" if stripped =~ /[^0-9A-Fa-f]/
    [stripped].pack('H*')
	end

  # Convert binary data into a human-readable hex string.
  #
  # Whatever data is contained in the target string will be "exploded" into a sequence of 
  # hexadecimal tuples, one space between each tuple, for ease of debugging and reading.
  # 
  # Returns a newly created string containing the hex string -- the target binary string will not be modified.
  #
  # Eg:
  #   >> "hello world".to\_hex\_string
  #   => "68 65 6c 6c 6f 20 77 6f 72 6c 64"
	def to_hex_string(readable = true)
    unpacked = self.unpack('H*').first
    if readable
      unpacked.gsub(/(..)/,'\1 ').rstrip
    else
      unpacked
    end
	end
end

# Include HexString extensions in the String class
class String
	include HexString
end
