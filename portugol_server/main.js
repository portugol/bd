var express = require('express'),
  http = require('http');

var app = express();
app.use(express.bodyParser());
app.use(express.static(__dirname + '/public'));


//POST a /couchset
app.post('/couchset', function (req, res) {
  console.log("####################################################");
  console.log("ENVIA PARA O COUCHDB");
  console.log("####################################################");
  console.log(req.body);

  var headers = {'Content-Type': 'application/json'};
  res.writeHead(200, headers);
  //enviar o resultado do get ao couchdb
  var aux  = {'prop1': 'xpto1', 'prop2': 'xpto2'};
  res.write(JSON.stringify(aux));
  res.end();
});


//GET a /couchget
app.get('/couchget', function (req, res) {
  console.log("####################################################");
  console.log("VAI BUSCAR AO COUCHDB");
  console.log("####################################################");
  console.log(req.query);

  //exemplo sem content-type
  res.send("bla bla bla");
});

app.listen(80, function () {
  console.log("Server listening on port 80");
});
