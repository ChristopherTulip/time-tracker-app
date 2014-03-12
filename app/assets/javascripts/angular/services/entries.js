module.service('entriesService', function() {
  return {
    get: function($http) {
      // return "hello world"
      return [
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
      // $http.get('/entries').then(function(result) {
      //   return result.data;
      // });
    }
  };
});
