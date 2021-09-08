
@test
Feature: My fist test 

Background: todo lo que se ejecuta antes del test
* url myVariableUrl
* print 'esta en background'

Scenario: Find Pets by Status
* print 'esta en scenario'
Given path 'pet/findByStatus'
And param status = 'available'
When method GET
Then assert responseStatus == 200 
* print response


Scenario: Find Pets by Tags
Given url 'https://petstore3.swagger.io/api/v3/pet/findByTags?tags=one'
When method GET
* print response

Scenario: Add New Pet
Given path 'pet'
* def myPet = 
"""
    {
  "id": 10,
  "name": "doggie",
  "category": {
    "id": 1,
    "name": "Dogs"
  },
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
"""
    * print myPet
  Given request myPet
  When method post
  Then assert responseStatus == 200 
  * print response