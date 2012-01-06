require 'spec_helper'

describe Dawg::Node do
	before :each do
		@root = Dawg::Node.new
	end

	describe ':==' do
		it "returns true if its components all match" do
			node1 = Dawg::Node.new
			node1.letters = {'y' => {}}
			node1.eow = true
			node1.max_depth = 0
	
			node2 = Dawg::Node.new
			node2.letters = {'y' => {}}
			node2.eow = true
			node2.max_depth = 0
	
			node1.should == node2
		end
	end

	describe ':===' do
		it "returns true if its components all match" do
			node1 = Dawg::Node.new
			node1.letters = {'y' => {}}
			node1.eow = true
			node1.max_depth = 0
	
			node2 = Dawg::Node.new
			node2.letters = {'y' => {}}
			node2.eow = true
			node2.max_depth = 0
	
			node1.should === node2
		end
	end

	describe '#add_char_array' do
		it "should set @eow if the array is empty" do
			@root.add_char_array([])
			@root.eow.should be_true
		end
		it "adds a node for the first letter" do
			@root.add_char_array %w(d o)
			@root['d'].should_not be_nil
		end
		
		it "calls itself recursively for the rest of the array" do
			@root.add_char_array %w(d o)
			child = @root['d'].letters['o']
			child.should_not be_nil
			child.eow.should be_true
		end
	end

	describe '#add_str(str)' do
		it "adds a string of letters to itself, creating child nodes as necessary" do
			@root.add_str('do')
			@root['d'].should_not be_nil
			child = @root['d']['o']
			child.should_not be_nil
			child.eow.should be_true
		end
	end

	describe'#empty?' do
		it "returns true if letters are empty" do
			@root.should be_empty
		end
		it "returns false if letters aren't empty" do
			@root.add_str('p')
			@root.should_not be_empty
		end
	end

	describe '#add_depths' do
		it "sets the @max_depth property" do
			word = 'cat'
			@root.add_str(word)
			@root.add_depths

			md = word.length - 1
			node = @root
			word.each_char do |ch|
				node.max_depth.should eq(md)
				node = node.letters[ch]
				md -= 1
			end
		end
	end

	describe '#add_to_depth_array' do
		before :each do
			@node_array = []
			0.upto(10) {|i| @node_array[i] = []}
		end

		it "adds itself to array[0] if it's a leaf" do
			@root.add_str("a")
			@root.add_depths
			@root.add_to_depth_array(@node_array)
			@node_array[0].index(@root).should_not be_nil
		end
	
		it "adds itself and its children if it's not a leaf" do
			word = 'cat'
			@root.add_str(word)
			@root.add_depths
			@root.add_to_depth_array(@node_array)
		
			node = @root
		
			word.each_char do |ch|
				@node_array[node.max_depth].index(node).should_not be_nil, "Expected #{node} to be in @node_array[#{node.max_depth}]"
				node = node[ch]
			end

		end
	end

	describe '#dawgify' do
		it "sets @max_depth" do
			@root.add_str('cat')
			@root.dawgify
			@root.max_depth.should eq(2)
		end
		it "merges nodes" do
			@root.add_str('city')
			@root.add_str('pity')
			@root.dawgify
			child1 = @root['c']
			child2 = @root['p']
			child1['i'].should equal(child2['i'])
		end
	end

	describe '#include?' do
		before :each do 
			@root.add_str("cart")
			@root.dawgify
		end
		it "returns true if it contains the supplied string" do
			@root.include?('cart').should be_true
		end
			
		it "returns false if it doesn't contain the supplied string" do
			@root.include?('dog').should be_false
			@root.include?('car').should be_false
		end
	end

	describe '#add_from_array' do
		it "adds all the words contained in the array" do
			words = %W(city cities pity pities)
			@root.add_from_array words
			@root.dawgify
			words.each {|word| @root.include?(word).should be_true}
		end
	end

end
