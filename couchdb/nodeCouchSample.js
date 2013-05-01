var nano = require('nano');
var server = nano('http://127.0.0.1:5984');

server.db.create('mydb', function(err){
	if(err){throw err;}

	console.log('created mydb');
	var doc1 = {a:1, b:2, c:"abc", d:[1,2,3]};
	var db = server.use('mydb');
	db.insert(doc1, 'doc_one', function(err){
		if (err) {throw err;};
		console.log('inserted obj1');
		db.get('doc_one', function(err, val){
			console.log('doc_one = ', val);
		});
	});

});