var timeControllers = angular.module('timeControllers', []);

timeControllers.controller('TimeEntryCtrl', ['$scope', 'entriesService',
  function($scope, entriesService) {

		$scope.entries = entriesService.get();

		$scope.stats = [
			{
				'name': 'week',
				'value': 12
			},
			{
				'name': 'month',
				'value': 48
			},
			{
				'name': 'year',
				'value': 200
			}
		];


		$scope.addEntry = function (cat) {
			//send post to server to add an entry to database

			//after successful callback:

			 var id = $scope.entries[$scope.entries.length - 1].id; //this would be handled by server
			 $scope.newEntry.id = id;
			 $scope.entries.push($scope.newEntry);
			 console.log($scope.newEntry);
			 $scope.newEntry = {};
			console.log('newEntry');

		};

		$scope.editEntry = function (entry) {

			//send PUT to server to update database

			//angular automatically updates it for you
		};

		$scope.deleteEntry = function (entry) {
			//send delete message to server to remove entry from database
			//find specific entry that changed and remove it
			var index = $scope.entries.indexOf(entry);

			if (index > -1) {
				$scope.entries.splice(index, 1);
			}
		};

		$scope.orderProp = '-date';
}]);

