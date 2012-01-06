require 'spec_helper'

describe Dawg do
	context 'creation' do
		describe '::create' do
			it "should create a dawg from a word array if :array is passed in" do
				dawg = Dawg.create :array => %W(cat dog)
				dawg.should be_kind_of(Dawg), "result should be a dawg, not a #{dawg.class}"
				dawg.root.should be_kind_of(Dawg::Node)
			end
			it "should create a dawg from an open file if :file is passed in" do
				text = <<EOF
city
cities
pity
pities
EOF
				dawg = Dawg.create :file => StringIO.new(text)
				dawg.should be_kind_of(Dawg), "result should be a dawg, not a #{dawg.class}"
				dawg.root.should be_kind_of(Dawg::Node)
			end
		end
	end #creation
		
	describe '#include?' do
		it "searches the dawg to see if the word is included" do
			@words = %W(city cities pity pities)
			dawg = Dawg.create :array => @words
			@words.each {|word| dawg.include?(word).should be_true}
			dawg.include?('it').should be_false
		end
	end
	
end
