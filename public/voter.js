var Voter = angular.module('voter', []);

Voter.controller('Candidate', ['$scope','$http', function($scope, $http){
  $http.get('/candidates/').success(function(data){
    $scope.candidates = data;
  });

  $scope.add = function(){
    var data = {
      name: $scope.name,
      url: $scope.url
    };
    $http.post('/candidates/', data).success(function(data){
      $http.get('/candidates/').success(function(data){
        $scope.candidates = data;
      });
    });
  }

  $scope.update = function(){
    $http.get('/candidates/').success(function(data){
      $scope.candidates = data;
    });
  }

  $scope.vote = function(candidate_id){
    $http.put('/candidates/'+ candidate_id).success(function(data){
      $http.get('/candidates/').success(function(data){
        $scope.candidates = data;
      });
    });
  }
}]);

