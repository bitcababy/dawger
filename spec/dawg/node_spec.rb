require 'spec_helper'

module Dawg
	describe Node do
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
	

	end
end


