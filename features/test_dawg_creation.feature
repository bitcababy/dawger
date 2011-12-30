Feature: Create dawg
  In order to test creating a dawg
  As a developer
  I want to provide a list of words

  Scenario Outline: Create dawg from word list
		When I create a dawg from these words:
		 | word   |
		 | city   |
		 | cities |
		 | pity   |
		 | pities |
		Then my dawg should return <result> for <word>
		Scenarios:
			 | word   | result |
			 | city   | true   |
			 | cities | true   |
			 | pity   | true   |
			 | pities | true   |
			 | it     | false  |
			 | dog    | false  |

	  Scenario Outline: File
			Given a file with the contents:
				"""
				city
				cities
				pity
				pities
				"""
			When I create a dawg with the file
			Then my dawg should return <result> for <word>
			Scenarios:
				 | word   | result |
				 | city   | true   |
				 | cities | true   |
				 | pity   | true   |
				 | pities | true   |
				 | it     | false  |
				 | dog    | false  |

  
