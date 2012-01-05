require 'dawg/node'

module Dawger
	module Core
		def self.create_from_array(words = [])
			Dawg::Node.create_from_array(words)
		end
	
		def self.create_from_file(file)
			Dawg::Node.create_from_file(file)
		end
		
	end
	
end
