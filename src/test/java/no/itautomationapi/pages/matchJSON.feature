Feature: test

		Scenario: Verify JSON
		
		* def data = { foo: [{ bar: 1, baz: 'a' }, { bar: 2, baz: 'b' }, { bar: 3, baz: 'c' }]}
		
		* match each data.foo == { bar: '#number', baz: '#string' }
		
		# and you can use 'contains' the way you'd expect
		* match each data.foo contains { bar: '#number' }
		* match each data.foo contains { bar: '#? _ != 4' }
		
		# some more examples of validation macros
		* match each data.foo contains { baz: "#? _ != 'z'" }
		* def isAbc = function(x) { return x == 'a' || x == 'b' || x == 'c' }
		* match each data.foo contains { baz: '#? isAbc(_)' }
		
		Given def json =
		  """
		  {
		    "hotels": [
		      { "roomInformation": [{ "roomPrice": 618.4 }], "totalPrice": 618.4  },
		      { "roomInformation": [{ "roomPrice": 679.79}], "totalPrice": 679.79 }
		    ]
		  }
		  """
		Then match each json.hotels contains { totalPrice: '#? _ == _$.roomInformation[0].roomPrice' }
		# when validation logic is an 'equality' check, an embedded expression works better
		Then match each json.hotels contains { totalPrice: '#(_$.roomInformation[0].roomPrice)' }