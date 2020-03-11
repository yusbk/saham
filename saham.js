// // saham.js
// var webPage = require('webpage');
// var page = webPage.create();
// var fs = require('fs');

// page.open('https://www.oslobors.no/markedsaktivitet/#/list/shares/quotelist/ob/all/all/false', function (status) {
//   fs.write('data/saham.html',page.content,'w')
//   phantom.exit();
// });


// saham.js

var webPage = require('webpage');
var page = webPage.create();

var fs = require('fs');
var path = 'saham.html'

page.open('http://www.techstars.com/companies/stats/', function (status) {
  var content = page.content;
  fs.write(path,content,'w')
  phantom.exit();
});
