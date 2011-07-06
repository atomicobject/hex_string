Description
===========
HexString provides two String extension methods: 

* `String#to_hex_string` explodes a string of binary data into human-readable hex tuples, and 
* `String#to_byte_string` converts a string of human-readable hex digits into the corresponding bytes.

Examples
--------

    # Convert data to human-readable hex tuples:
    >> "hello".to_hex_string
    => "68 65 6c 6c 6f"

    # Compact a hex string into its data equivalent:
    >> "77 6f 72 6c 64".to_byte_string
    => "world"

    # (#to_byte_string is space and case-insensitive:)
    >> "776F726C64".to_byte_string
    => "world"

    # Peek at the first 4 bytes of an executable on OS X:
    >> File.read("/bin/ls")[0..3].to_hex_string
    => "ca fe ba be"

Motivation
----------
When working with binary message or file formats, we often want to have a peek
at some segment of binary data and talk about individual byte values in
human-relatable terms.

This sort of thing comes in handy during testing, debugging and data
introspection, especially when it's inconvenient or impractical to capture the
desired binary data to file in order to view it with a hex editor or other
binary file reader.

We were inspired to publish this humble Gem after we found ourselves copying it
by hand from project to project over the course of several years.

Authors
=======
* Micah Alles (alles@atomicobject.com)
* David Crosby (crosby@atomicobject.com)
* © 2011 [Atomic Object](http://www.atomicobject.com/)
* More Atomic Object [open source](http://www.atomicobject.com/pages/Software+Commons) projects
