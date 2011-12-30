class Dawg::Node
	attr_accessor :letters, :eow, :max_depth

	def initialize
		@letters = {}
		@eow = false
		@max_depth = 0
	end

	def ==(node)
		(node.kind_of? self.class) && (self.letters == node.letters) && (self.eow == node.eow)
	end

	def ===(node)
		(node.kind_of? self.class) && (self.letters == node.letters) && (self.eow == node.eow)
	end

	def to_s
		"#{"!," if @eow} #{@letters}"
	end

	def empty?
		return !@letters || @letters.empty?
	end

	def add_depths
		if @letters.empty?
			@max_depth = 0
		else
			@max_depth = 1 + (@letters.values.collect {|kid| kid.empty? ? -1 : kid.add_depths}).max
		end
	end

	def add_to_depth_array(arr)
		if @max_depth > 0 then
			@letters.each do |k,v| 
				if v then
					i = arr[@max_depth-1].index v
					if i then
						@letters[k] = arr[@max_depth - 1][i]
					else
						v.add_to_depth_array(arr)
					end
				else
					arr[0] << { k => v}
				end
			end
		end
		arr[@max_depth] << self unless arr[@max_depth].include? self
		return @max_depth
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
