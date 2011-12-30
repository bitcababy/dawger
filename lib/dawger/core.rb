require 'dawg'

module Dawger
	class Core
		def self.from_array(words = [])
			dawg = Dawg.new
			dawg.add_array(words)
			return dawg
		end
	
		def self.from_file(file)
			dawg = Dawg.new
			dawg.from_file(file)
			return dawg
		end
	end
end
