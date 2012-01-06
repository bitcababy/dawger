class Dawg
	attr_accessor :root

	class << self
		def create(*opts)
			args = opts[0]
			dawg = Dawg.new
			if args[:array] then
				dawg.create_from_array args[:array]
			elsif args[:file] then
				dawg.create_from_array args[:file]
			else
				raise Dawg::Exception.new 'invalid arguments'
			end
			return dawg
		end
	end
	
	def create(*opts)
		args = opts[0]
		if args[:array] then
			create_from_array args[:array]
		elsif args[:file] then
			create_from_array args[:file]
		else
			raise Dawg::Exception.new 'invalid arguments'
		end
	end

	def create_from_array(words = [])
		@root = Dawg.new
		@root = Dawg::Node.new
		words.each {|word| @root.add_str normalize(word)}
		@root.dawgify
		return self
	end

	def create_from_file(file)
		@root = Dawg::Node.new
		file.each_line {|word| @root.add_str(normalize(word))}
		@root.dawgify
		return self
	end

	def include?(str)
    @root.include?(normalize(str))
	end

	def normalize(str)
		return str.chomp.downcase.strip
	end

end

class Dawg::Exception < Exception
end
