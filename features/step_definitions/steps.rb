When /^I create a dawg from these words:$/ do |table|
	words = table.hashes.collect {|hash| hash['word']}
	my_dawg.create :array => words
end

Given /^a file with the contents:$/ do |text|
	my_file.string = text
end

When /^I create a dawg with the file$/ do
	my_dawg.create :file => my_file
end

Then /^my dawg should return (#{TRUE_OR_FALSE}) for ([a-zA-Z]+)$/ do |res, word|
	my_dawg.include?(word).should eq(res)
end
