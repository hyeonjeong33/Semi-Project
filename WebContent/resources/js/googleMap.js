
	/************************** Google 지도 초기화  **************************/
	function initMap() {
    	  var directionsDisplay = new google.maps.DirectionsRenderer;
          var directionsService = new google.maps.DirectionsService;
          var myDestination;
          var map;
          var infowindow;
          $(".floating-direction").hide();
          
    		/* geolocation 가져오기 성공 */
    	  navigator.geolocation.getCurrentPosition(function(pos){
    		
    			lat = pos.coords.latitude;
    			lng = pos.coords.longitude;
    			
    			var myLocation = new google.maps.LatLng(lat, lng);
    			var mapOptions = {
    				zoom : 16,
    				mapTypeId : google.maps.MapTypeId.ROADMAP,
    				center : myLocation
    			} 
    			map = new google.maps.Map(document.getElementById('map'), mapOptions);
    			directionsDisplay.setMap(map); 
    			
    			var input = document.getElementById('panel-input');
    			var strictBounds = true;
    			
    	        var autoComplete = new google.maps.places.Autocomplete(input);
    	        
    	        autoComplete.bindTo('bounds', map);

    	        // Set the data fields to return when the user selects a place.
    	        autoComplete.setFields(['address_components', 'geometry', 'icon', 'name']);
    	        
    	        var marker = new google.maps.Marker({
    	            map: map,
    	            anchorPoint: new google.maps.Point(0, -29)
    	        });
    	        
    	        var context = '<strong>목적지</strong>';
    	        infowindow = new google.maps.InfoWindow({
    	        	content : context
    	        });
    
    	        google.maps.event.addListener(autoComplete, 'place_changed', function() {
    	        	var place = autoComplete.getPlace();
    	        	if (place.geometry) {
    	        		myDestination = place.geometry.location;
	    	        	map.panTo(myDestination);
	    	        	map.setZoom(17);

	    	        	marker.setPosition(place.geometry.location);
	    	        	marker.setVisible(true);
	    	        	infowindow.open(map,marker);
	    	        	calculateAndDisplayRoute(directionsService, directionsDisplay, myLocation, myDestination);
	    	        	$(".floating-direction").toggle();
    	        	} 
    	        	
    	        });
    	        
    	  });
    	  
      }

	
	
	/************************** 경로 계산  **************************/
    function calculateAndDisplayRoute(directionsService, directionsDisplay, myLocation, myDestination) {
        //alert("내 위치: " + myLocation);
        directionsService.route({
          origin: myLocation,
          destination: myDestination, 
          // Note that Javascript allows us to access the constant
          // using square brackets and a string value as its
          // "property."
             travelMode: 'TRANSIT'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    

    
    
    