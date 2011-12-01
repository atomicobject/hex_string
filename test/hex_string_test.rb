require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/hex_string')

class HexStringTest < Test::Unit::TestCase
	def self.should(behave,&block)
		mname = "test_should_#{behave}"
		if block
			define_method mname, &block
		else
			puts ">>> UNIMPLEMENTED CASE: #{name.sub(/Test$/,'')} should #{behave}"
		end
	end

  should "allow human readable hex strings to become actual byte strings" do
		human = "0102030405060708090a0b0c0d0e0f"
		expect = "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
		assert_equal expect, human.to_byte_string
	end

	should "not care about case of a-f or A-F" do
		human = "aabbccddeeffAABBCCDDEEFF"
		expect = "\xaa\xbb\xcc\xdd\xee\xff\xaa\xbb\xcc\xdd\xee\xff"
		assert_equal expect, human.to_byte_string
	end

	should "ignore whitespace of all kinds" do
		human = "\t\t\taa   \t\t bb c\nc d\tdee  ffAABBCCDDEEFF\t \n\r"
		expect = "\xaa\xbb\xcc\xdd\xee\xff\xaa\xbb\xcc\xdd\xee\xff"
		assert_equal expect, human.to_byte_string
	end

	should "reject odd lengths of digits" do
		human = "abbccddeeffAABBCCDDEEFF"
		err = assert_raise(RuntimeError) do 
		  human.to_byte_string 
	  end
		assert_match(/even/,err.message)
		assert_match(/digits/,err.message)
	end

	should "reject non-hex digits" do
		human = "aabbccddXKeeffAABBCCDDEEFF"
		err = assert_raise(RuntimeError) do 
		  human.to_byte_string 
	  end
		assert_match(/hex/,err.message)
	end

	should "convert byte strings into human readable hex strings" do
		assert_equal "68 65 6c 6c 6f", "hello".to_hex_string
	end

	should "convert byte strings into a single hex string without spaces" do
		assert_equal "68656c6c6f", "hello".to_hex_string(false)
	end

	should "provide empty hex strings when operating on empty strings" do 
	  assert_equal "", "".to_hex_string
	end

end
