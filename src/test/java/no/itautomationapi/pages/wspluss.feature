
Feature: sample karate test script for ws+
 
	Background:
	
	* url 'https://utvapp1.intern.acos.no/wspluss/ho/intern/api/api/register/'
	* configure headers = { Accept: 'application/json' }
	* configure ssl = true
    * header Authorization = 'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjE2NjFFQ0U1ODNFRjE1RUJCNzhCNjBFNDQ0Q0U4NTE0MzQ5MjRBRTEiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJGbUhzNVlQdkZldTNpMkRrUk02RkZEU1NTdUUifQ.eyJuYmYiOjE1Nzk4MDc4NzksImV4cCI6MTU3OTgxMTQ3OSwiaXNzIjoiaHR0cHM6Ly91dHZhcHAxLmludGVybi5hY29zLm5vL3dzcGx1c3MvaG8vaW50ZXJuL2lkZW50aXR5c2VydmVyIiwiYXVkIjpbImh0dHBzOi8vdXR2YXBwMS5pbnRlcm4uYWNvcy5uby93c3BsdXNzL2hvL2ludGVybi9pZGVudGl0eXNlcnZlci9yZXNvdXJjZXMiLCJzb2NrZXRhcGkiLCJwbHVzc2FwaSIsIm1vdGVhcGkiXSwiY2xpZW50X2lkIjoiV2ViU2FrKyIsInN1YiI6IjEwNzE3IiwiYXV0aF90aW1lIjoxNTc5ODA3ODc5LCJpZHAiOiJsb2NhbCIsIm5hbWUiOiJTZW50aGlsa3VtYXIgU2VuZ290dHV2ZWwiLCJ3aW5kb3dzbG9naW4iOiJzZW50aGlsIiwiYWNvc1VzZXJTdG9yZUlkIjoiMHg5REIxNjA0QjQ4N0U0QzlDNTM2Mjg4Rjg3Rjg3Iiwic2NvcGUiOlsib3BlbmlkIiwicHJvZmlsZSIsImVtYWlsIiwic29ja2V0X2FwaSIsInBsdXNzX2FwaSIsIm1vdGVfYXBpIl0sImFtciI6WyJwd2QiXX0.cUR_2CY9YpOBFI9X2ImCCIXMZVvV2X87IBJkBW2dXL2-q7fP2-17DB15LKJcnw8om-tAAjh6YwJesF9qoW-z9mFYZUvRHDSmaVkD3K81cLlnuYC940SZ2YpdHxaEsEYoGkHBJUfikEjuCAHbj8Ipalb2ZjCxH9UiWeCjwALC_QaSr_x9Bn_uL-Y9JYrCmd31kd-zNHPTjd-KddFhtVDycmAXeIaLLCWHbyLvKp7yQCgBmL0YzYtv3MxgHoWBTfdvWq42hdQCSROYq2jnypJRWQxMpvm1EfqjGiZDOQ3QJuWq4r6H8JnmXFBfe-uNdKAiGRvTi8J1X7tdRI8J-xyoBQ'
	
	@tagdemo
	Scenario: get all users and then get the first user by id	 
	Given path 'sakmaler'
	When method get
	Then status 200
	And def res = response
	And match each response contains { id: '#number', tittel: '#string' }
	And match res == read('sakmal.json')
	And match res == 
"""
[
  {
    "id": '#number',
    "tittel": "Ny sak"
  },
  {
    "id": 13,
    "tittel": "Ny byggesak"
  },
  {
    "id": 17,
    "tittel": "Ny elevmappe"
  },
  {
    "id": 18,
    "tittel": "Ny personalmappe"
  },
  {
    "id": 55,
    "tittel": "Barnevernsak"
  },
  {
    "id": 56,
    "tittel": "Kathrine malsak jp fil"
  },
  {
    "id": 52,
    "tittel": "Malsak med et veldig langt navn blir stopp"
  },
  {
    "id": 53,
    "tittel": "Malsak med skjerming og merknad"
  },
  {
    "id": 54,
    "tittel": "Marit Samlemappe"
  },
  {
    "id": 51,
    "tittel": "Ny Sak2"
  },
  {
    "id": 47,
    "tittel": "Nytt prosjekt"
  },
  {
    "id": 49,
    "tittel": "Tilleggsdata knyttet til sakstype"
  },
  {
    "id": 50,
    "tittel": "Tilleggsdata ligger i malsaken"
  }
]
"""