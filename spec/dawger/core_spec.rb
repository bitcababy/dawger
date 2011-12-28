require 'spec_helper'

describe Dawger do
	describe "::from_array" do
		it "takes an array of words and turns them into a dawg" do
			words = %W(city cities pity pities)
			dawg = Dawg.from_array
		end
	end

end