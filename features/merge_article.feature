Feature: Merge Articles
  As a blog administrator
  In order to combine articles with similar topics
  I want to merge articles

Background:
  Given the blog is set up
  Given I am logged into the admin panel
  Given the following articles exist
  | title		| body		| comment 	| comment_user 	|
  | Guitars		| PRS 		| mayer		| John 			|
  | Ukuleles 	| Kamaka	| sup      	| Jake 			|

  Given I am on the edit page for "Guitars"

Scenario: A non-admin cannot merge articles.
  When I am not logged into the admin panel
  Then I should be on the login page

Scenario: When articles are merged, the merged article should contain the text of both previous articles.
  When I fill in "merge_with" with the id of "Ukuleles"
  And I press "Merge"
  Then I should be on the admin content page
  When I go to the home page
  Then I should see "Guitars"
  When I follow "Guitars"
  Then I should see "PRS"
  And I should see "Kamaka"

Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article).
  When I fill in "merge_with" with the id of "Ukuleles"
  And I press "Merge"
  Then the author of "Guitars" should be "admin"

Scenario: Comments on each of the two original articles need to all carry over and point to the new merged article.
  When I fill in "merge_with" with the id of "Ukuleles"
  And I press "Merge"
  Then I should be on the admin content page
  When I go to the home page
  Then I should see "Guitars"
  When I follow "Guitars"
  Then I should see "mayer"
  And I should see "sup"

Scenario: The title of the new article should be the title from either one of the merged articles.
  When I fill in "merge_with" with the id of "Ukuleles"
  And I press "Merge"
  Then I should be on the admin content page
  When I go to the home page
  Then I should see "Guitars"
  And I should not see "Ukuleles"

