require 'dawger/version'
require 'dawg/base'
require 'dawg/node'
require 'dawger/core'

module Dawger
	class << self
		def from_array(words = [])
			dawg = Dawg::Base.new
			for word in words do
				dawg.add word
			end
			return dawg
		end
	end
end