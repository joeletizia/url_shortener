# I'm a very big proponent of Cucumber for BDD. I love that I can take this feature description and share it with my product stakeholders.
# I've even worked on teams where product owners wrote these with us. It established great Ubiquitous Language (from Eric Evans in DDD)
Feature: Shorten a URL
  As a user
  I want the ability to shorten a URL
  So that I can save space and not have to type really long URLS when sharing cool internet stuff with my friends

  Scenario: Creating a shortened URL
    When I visit the Shorten URL page
    And I try to shorten "http://reddit.com/r/rails"
    Then I should recieve a shortened URL

  @selenium
  Scenario: Using a shortened URL
    Given there is a shortened URL for "http://reddit.com/r/rails"
    When I visit the endpoint for the shortened URL
    Then I should be redirected to the shortened url's ultimate destination
