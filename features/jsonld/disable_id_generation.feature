Feature: Disable Id generation on anonymous resource collections
  In order to use API resource
  As a developer
  I need to be able to disable id generation on anonymous resource collections

  @createSchema
  Scenario: I should be able to POST a new entity
    When I add "Accept" header equal to "application/ld+json"
    And I add "Content-Type" header equal to "application/ld+json"
    When I send a "POST" request to "/disable_id_generations" with body:
    """
    {
      "id": 1,
      "disableIdGenerationItems": [
        {
          "id": 1,
          "uuid": "daa12345-a4b3-47d4-8c40-38451df2e20c",
          "propertyId": 1
        }
      ]
    }
    """
    Then the response status code should be 201
    Then the JSON node "disableIdGenerationItems[0].@id" should not exist
    And the JSON should be equal to:
    """
    {
      "@context": "/contexts/DisableIdGeneration",
      "@id": "/disable_id_generations/1",
      "@type": "DisableIdGeneration",
      "id": 1,
      "disableIdGenerationItems": [
        {
          "@type": "DisableIdGenerationItem",
          "id": 1,
          "uuid": "daa12345-a4b3-47d4-8c40-38451df2e20c",
          "propertyId": 1
        }
      ]
    }
    """
