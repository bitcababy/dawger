When /^I create a dawg from these words:$/ do |table|
	words = table.hashes.collect {|hash| hash['word']}
	my_dawg.add_array(words)
	my_dawg.should be_kind_of Dawg
end

Then /^my dawg should return (#{TRUE_OR_FALSE}) for ([a-zA-Z]+)$/ do |res, word|
	my_dawg.find(word).should eq(res)
end

Given /^a file with the contents:$/ do |text|
	my_file.string = text
end

When /^I create a dawg with the file$/ do
	my_dawg.from_file(my_file)
end

Then /^I should receive a dawg$/ do
  pending # express the regexp above with the code you wish you had
end
