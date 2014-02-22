var timetrackApp = angular.module('timetrackApp', []);

timetrackApp.controller('TimeEntryCtrl', function ($scope) {
	$scope.entries = [
		{
			'id': 1,
			'project': 'TAing',
			'hours': 6,
			'date': '2014-01-23',
			'comment': 'This is cray cray.'
		},
		{
			'id': 2,
			'project': 'TAing1',
			'hours': 3,
			'date': '2014-02-07',
			'comment': 'Rails is magic.'
		},
		{
			'id': 3,
			'project': 'TAing2',
			'hours': 2,
			'date': '2014-02-15',
			'comment': 'Oh my god a test.'
		}
	];

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
});

// # @timeApp = angular.module "timeApp", []

// # @timeApp.controller 'timeCtrl', ['$scope', '$http',
// #   ($scope, $http) ->
// #     $http.get('/entries.json').success( (data) ->
// #         $scope.entries = data
// #       ).error( (data) ->
// #         $scope.entries = "ERROR I THINK I FAILED"
// #       )
// # ]

