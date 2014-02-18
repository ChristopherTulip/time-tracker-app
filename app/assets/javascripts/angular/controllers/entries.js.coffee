@timeApp = angular.module "timeApp", []

@timeApp.controller 'timeCtrl', ['$scope', ($scope) ->
  $scope.hello = "world"
]
