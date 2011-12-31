require 'spec_helper'

module DawgNodeHelper
	def add_kid(node, ch)
		node.letters[ch] = Dawg::Node.new
	end
	
	def from_str(str="")
		node = root = Dawg::Node.new
		str.each_char do |ch|
			node = node.letters[ch] = Dawg::Node.new
		end
		return root
	end
	
	def check_node_in_arr(node, arr)
		arr[node.max_depth].index(node)
	end
	
end

describe Dawg::Node do
	include DawgNodeHelper

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
	
	describe'#empty?' do
		it "returns true if letters are empty" do
			node = Dawg::Node.new
			node.empty?.should be_true
		end
		it "returns false if letters aren't empty" do
			node = Dawg::Node.new
			add_kid(node, 'p')
			node.empty?.should be_false
		end
		
	end

	describe '#add_depths' do
		it "sets the @max_depth property" do
			root = from_str('city')
			root.add_depths
			root.max_depth.should eq(3)
			root.letters['c'].max_depth.should eq(2)
		end
	end

	describe '#add_to_depth_array' do
		before :each do
			@node_array = {}
			0.upto(10) {|i| @node_array[i] = []}
		end

		it "adds itself to array[0] if it's a leaf" do
			root = from_str("a")
			root.add_depths
			root.add_to_depth_array(@node_array)
			@node_array[0].index(root).should_not be_nil
		end
		
		it "adds itself and its children if it's not a leaf" do
			word = 'cat'
			root = from_str(word)
			root.add_depths
			root.add_to_depth_array(@node_array)
			
			check_node_in_arr(root, @node_array).should_not be_nil
			node = root['c']
			check_node_in_arr(node, @node_array).should_not be_nil
			node = node['a']
			check_node_in_arr(node, @node_array).should_not be_nil
			node = node['t']
			node.empty?.should be_true
		end
	end

	
end # Dawg::Node
	
	
	# 
	# def merge_nodes(candidates)
	# 	@letters.each do |k, v|
	# 		i = candidates.index v
	# 		if i then
	# 			@letters[k] = candidates[i]
	# 		end
	# 	end
	# end

	


