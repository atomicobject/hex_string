module HexString
	def to_byte_string
		stripped = self.gsub(/\s+/,'')
		unless stripped.size % 2 == 0
			raise "Can't translate a string unless it has an even number of digits"
		end
    raise "Can't translate non-hex characters" if stripped =~ /[^0-9A-Fa-f]/
    [stripped].pack('H*')
	end

	def to_hex_string
    self.unpack('H*').first.gsub(/(..)/,'\1 ').rstrip
	end
end

class String
	include HexString
end
