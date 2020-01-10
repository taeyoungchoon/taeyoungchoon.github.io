#!/usr/bin/env node

var http = require('http')

http.createServer(function(req,res){
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('hello, another node');
}).listen(3000);

console.log('hello using Node.js: http://localhost:3000')
