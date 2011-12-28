require 'dawg/base'

module Dawger
	class Core
		def self.from_array(words = [])
			dawg = Dawg::Base.new
			for word in words do
				dawg.add word
			end
			return dawg
		end
	end
end
