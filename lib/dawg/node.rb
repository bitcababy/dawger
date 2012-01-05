module Dawg
	class Node
		attr_accessor :letters, :eow, :max_depth

		@@downcase = true
		@@strip = true

		def self.create_from_array(words = [])
			root = Dawg::Node.new
			root.add_from_array(words)
			root.dawgify
			return root
		end

		def self.create_from_file(file)
			root = Dawg::Node.new
			root.add_from_file(file)
			root.dawgify
			return root
		end

		def initialize
			@letters = {}
			@eow = false
			@max_depth = 0
		end

		def dawgify
			add_depths
			arr = create_depth_array
			1.upto(arr.count - 1) do |i|
				arr[i].each do |node|
					merge_nodes arr[@max_depth - 1]
				end
			end
		end
	
		def normalize(str)
			str.downcase! if @@downcase
			str.strip! if @@strip
			return str
		end

		def find(str)
	    node = self
	    str.each_char { |ch|
	      cur = ch 
	      node = node.letters[cur]
				return false if node.nil?
	    }
	    return node.eow
	  end
	
		def add_from_array(words=[])
			words.each {|word| add_str(word)}
		end
	
		def add_from_file(file)
			file.each_line {|word| add_str(word)}
		end

		def ==(node)
			(node.kind_of? self.class) && (self.letters == node.letters) && (self.eow == node.eow)
		end

		def ===(node)
			(node.kind_of? self.class) && (self.letters == node.letters) && (self.eow == node.eow)
		end

		def [](i)
			@letters[i]
		end

		def to_s
			"#{"!," if @eow} #{@letters}"
		end

		def empty?
			return !@letters || @letters.empty?
		end

		def eow?
			return @eow
		end

		def add_char_array arr
			@eow = arr.empty?
			return if @eow
			ch = arr.shift
			child = @letters[ch] ||= self.class.new
			child.add_char_array arr
		end
	
		def add_str str
			add_char_array normalize(str).split('')
		end
	
		def add_depths
			if @letters.empty?
				@max_depth = 0
			else
				@max_depth = 1 + (@letters.values.collect {|kid| kid.empty? ? -1 : kid.add_depths}).max
			end
		end

		def create_depth_array
			arr = Array.new(@max_depth + 1) {Array.new}
			add_to_depth_array(arr)
			return arr
		end

		def add_to_depth_array(arr)
			arr[@max_depth] << self unless arr[@max_depth].include? self
			return if @letters.empty?
			@letters.each do |k,v|
				v.add_to_depth_array(arr)
			end
		end

		def merge_nodes(candidates)
			@letters.each do |k, v|
				i = candidates.index v
				if i then
					@letters[k] = candidates[i]
				end
			end
		end
	
		def children
			return [] if empty?
			arr = @letters.values
			arr = arr.delete_if {|item| item.empty?}
			for node in arr do
				arr += node.children
			end
			return arr
		end
	end
end