'use strict';

// Declare app level module which depends on views, and components
var busServices = angular.module('busServices', ['ngSanitize', 'ui.select']);
busServices.constant('mock', false);
busServices.constant('mock_base_url', 'partials/mock/');
busServices.constant('base_url', 'services/api/v1/get/');

//Factories
busServices.factory('busServicesFactory', ['$http', 'mock', 'mock_base_url', 'base_url', function($http, mock, mock_base_url, base_url) {

    var factoryDefinitions = {
      getBusServiceNumbers: function() {
		var url = (mock) ? mock_base_url+'bus_service_numbers.json' : base_url+'bus-numbers';
        return $http.get(url).success(function(data) { return data; });
      },
	  getBusDirections: function($sn_id) {
		var url = (mock) ? mock_base_url+'bus_directions.json' : base_url+'bus-directions/'+$sn_id;
        return $http.get(url).success(function(data) { return data; });
      },
	  getBusStops: function($sn_id, $d_id) {
		var url = (mock) ? mock_base_url+'bus_stops.json' : base_url+'bus-stops/'+$sn_id+'/'+$d_id;
        return $http.get(url).success(function(data) { return data; });
      },
	  getBusArrivalTime: function($sn_id, $d_id, $s_id) {
		var url = (mock) ? mock_base_url+'bus_stops.json' : base_url+'bus-arrival-time/'+$sn_id+'/'+$d_id+'/'+$s_id;
        return $http.get(url).success(function(data) { return data; });
      }	  
	}
	
    return factoryDefinitions;
  }
]);

//Controllers
busServices.controller('busServicesController', ['$scope', 'busServicesFactory', function($scope, busServicesFactory) {
	
	//Init the scope for steps
	$scope.steps = {"step1":true, "step2":false, "step3":false, "step4":false};
	
	//Activate step
	$scope.activateStep = function(currentStep){
		angular.forEach($scope.steps, function(obj, key) {
			if(key == currentStep){
				$scope.steps[key] = true;
			}else{
				$scope.steps[key] = false;
			}
		});
	}
		
	//List buses
	$scope.getBusServiceNumbers = function(){
		$scope.selected = {}; //Init the selected scope which will be used for getting data feom services
		$scope.activateStep('step1');
		$scope.loading = true;
		busServicesFactory.getBusServiceNumbers().then(function(result){
			if (!result.data.error) {
			  $scope.busServices = result.data.list
			}else{
				$scope.data = result.data;
			}
			$scope.loading = false;
		});	
	}
	$scope.getBusServiceNumbers();
	
	//List directions
	$scope.getBusDirections = function(){
		$scope.activateStep('step2');
		$scope.loading = true;
		busServicesFactory.getBusDirections($scope.selected.busService.sn_id).then(function(result){
			if (!result.data.error) {
			  $scope.busDirections = result.data.list
			}else{
				$scope.data = result.data;
			}
			$scope.loading = false;
		});	
	}
	
	//List stops
	$scope.getBusStops = function(){
		$scope.activateStep('step3');
		$scope.loading = true;
		busServicesFactory.getBusStops($scope.selected.busService.sn_id, $scope.selected.busDirection.d_id).then(function(result){
			if (!result.data.error) {
			  $scope.busStops = result.data.list
			}else{
				$scope.data = result.data;
			}
			$scope.loading = false;
		});	
	}
	
	//Result
	$scope.getBusArrivalTime = function(){
		$scope.activateStep('step4');
		$scope.loading = true;
		busServicesFactory.getBusArrivalTime($scope.selected.busService.sn_id, $scope.selected.busDirection.d_id, $scope.selected.busStop.s_id).then(function(result){
			if (!result.data.error) {
			  $scope.results = result.data.list
			}else{
				$scope.data = result.data;
			}
			$scope.loading = false;
		});	
	}	
  
}]);


//Filters
busServices.filter('propsFilter', function() {
  return function(items, props) {
    var out = [];

    if (angular.isArray(items)) {
      items.forEach(function(item) {
        var itemMatches = false;

        var keys = Object.keys(props);
        for (var i = 0; i < keys.length; i++) {
          var prop = keys[i];
          var text = props[prop].toLowerCase();
          if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
            itemMatches = true;
            break;
          }
        }

        if (itemMatches) {
          out.push(item);
        }
      });
    } else {
      // Let the output be the input untouched
      out = items;
    }

    return out;
  }
});

var goto = function(cHash){
	var target = $(cHash);
	target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
	if (target.length) {
		$('html,body').animate({
			scrollTop: target.offset().top
		}, 1000);
		return false;
	}

}