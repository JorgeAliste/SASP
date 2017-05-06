(function () {
  'use strict';

  const elasticsearch = require('elasticsearch');
  const esClient = new elasticsearch.Client({
    host: '127.0.0.1:9200',
    log: 'error'
  });
  function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
  }
  const search = function search(index, body, arreglo) {
    return esClient.search({index: index, body: body});
  };

  const test = function test(a) {
    let body = {
      size: 100,
      from: 0,
      query: {
        match: {
          title: {
            query: a,
            //minimum_should_match: 3,
            fuzziness: 2
          }
        }
      }
    };
    var resultados = [];
    console.log(`retrieving documents whose title matches '${body.query.match.title.query}' (displaying ${body.size} items at a time)...`);
    search('library', body, resultados)
    .then(results => {
        console.log(`found ${results.hits.total} items in ${results.took}ms`);
        if (results.hits.total > 0) console.log(`returned article titles:`);
        results.hits.hits.forEach((hit, index) =>
        {
            resultados.push(`${hit._source.title}`);
            resultados.push(`${hit._source.link}`);
            //console.log(`\t${body.from + ++index} - ${hit._source.title} ${hit._source.link} (score: ${hit._score})`);
        });
        mostrarLista(resultados);
    

    })
    .catch(console.error);
    return(resultados)
  };
  const readline = require('readline');
  var arre = [];
  var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
  })
  rl.question("Ingresar búsqueda ", function(answer) {
  // TODO: Log the answer in a database
  console.log("Buscando:", answer);
  test(answer, arre);
  rl.close();
  });
  module.exports = {
    search
  };
} ());

function mostrarLista(arreglo)
{
    for (i = 0; i < arreglo.length; i++) {
        console.log(arreglo[i] + '\t');
    }
}