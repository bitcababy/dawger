require 'spec_helper'

describe Dawg::Base do
	before :each do
		@dawg = Dawg::Base.new
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
			@dawg.root.letters['c'].should eql(@dawg.root.letters['p'])
		end
	end #merge_nodes
	
	# context "file operations" do
	# 	before :each do
	# 		FakeFS.activate!
	# 	end
	# 	
	# 	after :each do
	# 		FakeFS.deactivate!
	# 		FakeFS::FileSystem.clear
	# 	end
	# end

	describe '#save' do
		before :each do
			%W(city cities pity pities).each {|w| @dawg.add(w)}
			@dawg.merge_nodes
		end
		
		it "dumps itself to a file" do
			@dawg.save
			Dawg::Base.path_for_lexicon('test').should exist
		end
	end
	
	describe "::load" do
		it "loads a dawg from a file" do
			dawg = Dawg::Base.load('test')
			puts dawg
		end
	end
			
	# 	it "creates the file if necessary" do
	# 		
	# 	it 'marshals the data to the file' do
	# 		puts Marshal.dump(@dawg)
	# 	end
	# 
	# 	it 'closes the file'
	# end
	
	
end
