require 'spec_helper'

describe Dawg do
	before :each do
		@dawg = Dawg.new
		@dawg.lexicon = 'test'
	end

	describe '#add(str)' do
		it 'loops through str, creating a hash as a value for each letter' do
			str = 'city'
			@dawg.add(str)
			@dawg.root.should_not be_empty
			
			
			@dawg.add('cities')
			pending  "don't know what test to put here"
			# puts @dawg
		end
	end # add

	describe '#find(str)' do
		it 'returns true if the string is found' do
			@dawg.add("cat")
			@dawg.add('dog')
			@dawg.add('do')
			@dawg.add('cart')
			@dawg.find('cat').should be_true
			@dawg.find('dog').should be_true
			@dawg.find('do').should be_true
			@dawg.find('car').should be_false
		end
	end # find

	describe '#add_depths' do
		it "calculates depth for each node" do
			%W(city cities pity pities).each {|w| @dawg.add(w)}
			@dawg.add_depths
			@dawg.root.max_depth.should eql(5)
		end
	end

	describe '#calc_depth_array' do
		it "organizes nodes by depth" do
			%W(city cities pity pities).each {|w| @dawg.add(w)}
			node_array = @dawg.calc_depth_array
			node_array.count.should eql(6)
		end
	end

	describe "#merge_nodes" do
		it "merges duplicate branches" do
			%W(city cities pity pities).each {|w| @dawg.add(w)}
			@dawg.merge_nodes
			root = @dawg.root
			root.letters['c'].should eql(@dawg.root.letters['p'])
		end
	end # merge_nodes


	# describe '#collect_nodes' do
	# 	it "returns all nodes in the dawg" do
	# 		@dawg.add("cat")
	# 		@dawg.add('dog')
	# 		@dawg.add('do')
	# 		@dawg.add('cart')
	# 		nodes = @dawg.collect_nodes
	# 	end
	# end
			
	# describe '#count_nodes' do
	# 	it "returns the number of nodes in the dawg" do 
	# 		@dawg.add("cat")
	# 		@dawg.add('dog')
	# 		@dawg.add('do')
	# 		@dawg.add('cart')
	# 		@dawg.count_nodes.should eq(8)
	# 	end
	# end
end
