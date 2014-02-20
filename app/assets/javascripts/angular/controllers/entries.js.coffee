@timeApp = angular.module "timeApp", []

@timeApp.controller 'timeCtrl', ['$scope', '$http',
  ($scope, $http) ->
    $http.get('/entries.json').success( (data) ->
        $scope.entries = data
      ).error( (data) ->
        $scope.entries = "ERROR I THINK I FAILED"
      )

    $scope.createEntry = () ->
      $scope.entries = "asdf"
]

