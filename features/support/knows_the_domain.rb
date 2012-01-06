require 'dawg'

module KnowsTheDomain
	def my_dawg
		@my_dawg ||= Dawg.new
	end

	def my_file
		@my_file ||= StringIO.new
	end

end

World(KnowsTheDomain)
