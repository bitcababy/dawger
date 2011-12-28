Feature: Create dawg from list
  In order to value
  As a role
  I want feature

  Scenario: List
		When I create a dawg named "dawg1" from these words:
			| word   |
			| city   |
			| cities |
			| pity   |
			| pities |
		Then "<word>" "<should>" be in dawg "dawg1"
			| word   | should |
			| city   | true   |
			| cities | true   |
			| pity   | true   |
			| pities | true   |
			| it     | false  |
			| dog    | false  |

