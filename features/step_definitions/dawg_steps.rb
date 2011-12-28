When /^I create a dawg named "([^"]*)" from these words:$/ do |arg1, table|
	words = table.hashes.collect {|hash| hash['word']}
	@dawg = Dawger.from_array words
	@dawg.should_not be_nil
end

Then /^"([^"]*)" "([^"]*)" be in dawg "([^"]*)"$/ do |word, should, dawgname, table|
	table.hashes.each do | hash |
		@dawg.find(hash['word']).should eql(hash['should'] == 'false' ? false : true)
	end
end