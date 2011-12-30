class Dawg
	attr_accessor :root, :lexicon

	class << self
		def from_array(words = [])
			dawg = Dawg.new
			dawg.add_arry(words)
			return dawg
		end

		def from_file(file)
			dawg = Dawg.new
			dawg.from_file(file)
			return dawg
		end
	end

  def initialize()
    @root = Dawg::Node.new
		@root.letters = {}
  end

	def add_array(words)
		for word in words do
			add(word)
		end
	end

	def from_file(file)
		file.each_line do |line|
			add line.downcase.strip
		end
	end

  def add(str)
		str = str.downcase.strip
		@root.max_depth = (str.length - 1) if str.length > @root.max_depth
		prev_node = node = @root
		cur = ''
    str.each_char { |ch|
			cur = ch
      prev_node = node
			if prev_node.letters then
				node = prev_node.letters[ch] || Dawg::Node.new
			else
				prev_node.letters = {}
        node = Dawg::Node.new
			end
			prev_node.letters[ch] ||= node
		}
		# prev_node.letters[cur] = if prev_node.letters[cur].empty?
		node.eow = true
  end

  def find(str)
		str = str.downcase.strip
    node = @root
    str.each_char { |ch|
      cur = ch 
      node = node.letters[cur]
			return false if node.nil?
    }
    return node.eow
  end

	def to_s
		@root.letters.to_s
	end

	def add_depths
		@root.letters.each do |k, node| 
			node.add_depths
			node.max_depth = (node.letters.values.collect {|c| c.max_depth}).max + 1
		end
	end

	def calc_depth_array
		self.add_depths
		node_array = {}
		0.upto(@root.max_depth) {|i| node_array[i] = []}
		@root.add_to_depth_array(node_array)
		return node_array
	end

	def merge_nodes
		node_array = self.calc_depth_array
		1.upto(node_array.count - 1) do |i|
			node_array[i].each do |node|
				node.merge_nodes node_array[node.max_depth - 1]
			end
		end
	end
	

	# def count_nodes()
	# 	arr = []
	# 	@root.letters.each_val |node|
	# 		arr += node.count_nodes if node
	# 	end
	# 	return arr.
	# end

end
