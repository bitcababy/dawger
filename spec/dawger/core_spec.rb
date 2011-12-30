require 'spec_helper'

describe Dawger::Core do
	describe "::from_array(array)" do
		it "takes an array of words and turns them into a dawg" do
			words = %W(city cities pity pities)
			dawg = Dawger::Core.from_array words
		end
	end
	
	describe "::from_file(filehandle)" do
		before :each do 
			@text = <<EOF
city
cities
pity
pities
EOF
		end
			
		it "receives a file and creates a dawg from the list of words" do
			# file = FakeFS::File.new
			# file.content = @text
			file = StringIO.open @text
			dawg = Dawger::Core.from_file(file)
			dawg.should_not be_nil
			dawg.should be_kind_of Dawg
			dawg.find('city').should be_true
		end
			
	end

end
