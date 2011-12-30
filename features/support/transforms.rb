TRUE_OR_FALSE = Transform /^(true|false)$/ do | true_or_false |
	true_or_false.downcase == 'true'
end

INTEGER = Transform /^\d+$/ do |number|
	number.to_i
end
