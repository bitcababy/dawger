require 'spec_helper'

describe Dawg::Node do
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
			node.letters["p"] = {}
			node.empty?.should be_false
		end
		
	end
	
	# describe '#children' do
	# 	it "returns an empty array if it doesn't have any kids" do
	# 		root = Dawg::Node.new
	# 		root.children.should eq([])
	# 	end
	# 	it "returns an array of all of its children" do
	# 		root = Dawg::Node.new
	# 		kid = root.letters['c'] = Dawg::Node.new
	# 		root.children.should be_empty
	# 		kid.letters['a'] = Dawg::Node.new
	# 		root.children.count.should eq(1)
	# 	end
	# end

	
end # Dawg::Node
	
	
	# def add_depths
	# 	if @letters.empty?
	# 		@max_depth = 0
	# 	else
	# 		@max_depth = 1 + (@letters.values.collect {|kid| kid.empty? ? -1 : kid.add_depths}).max
	# 	end
	# end
	# 
	# def add_to_depth_array(arr)
	# 	if @max_depth > 0 then
	# 		@letters.each do |k,v| 
	# 			if v then
	# 				i = arr[@max_depth-1].index v
	# 				if i then
	# 					@letters[k] = arr[@max_depth - 1][i]
	# 				else
	# 					v.add_to_depth_array(arr)
	# 				end
	# 			else
	# 				arr[0] << { k => v}
	# 			end
	# 		end
	# 	end
	# 	arr[@max_depth] << self unless arr[@max_depth].include? self
	# 	return @max_depth
	# end
	# 
	# def merge_nodes(candidates)
	# 	@letters.each do |k, v|
	# 		i = candidates.index v
	# 		if i then
	# 			@letters[k] = candidates[i]
	# 		end
	# 	end
	# end

	


