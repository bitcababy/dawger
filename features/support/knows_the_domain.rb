module KnowsTheDomain
	def my_dawg
		@my_dawg ||= Dawg::Node.new
	end

	def my_file
		@my_file ||= StringIO.new
	end

end

World(KnowsTheDomain)
