(function () {
  'use strict';
  const readline = require('readline');
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

  const test = function test(texto, cantidad) {
    let body = {
      size: cantidad,
      from: 0,
      query: {
        match: {
          title: {
            query: texto,
            //minimum_should_match: 3,
            fuzziness: 2
          }
        }
      }
    };
    var resultados = [];
    console.log(`Mostrando documentos relacionados con '${body.query.match.title.query}' (se muestran ${body.size} resultados)...\t`);
    search('library', body, resultados)
    .then(results => {
        //console.log(`found ${results.hits.total} items in ${results.took}ms`);
        if (results.hits.total > 0) console.log(`Documentos encontrados:`);
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
  var arre = [];

  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  rl.question('Ingrese la busqueda a realizar: ', (answer1) => {
    rl.question('Defina el número de resultados: ', (answer2) => {
        test(answer1, answer2)
        rl.close();
      });
  });
  module.exports = {
    search
  };
} ());

function mostrarLista(arreglo)
{
    for (i = 0; i < arreglo.length; i++) {
        if(i%2 == 0)
        {
          console.log("Título: " + arreglo[i]);
        }
        else
        {
          console.log("Enlace:" + arreglo[i] + '\t');
          console.log("----------------------------------------------");
        }
    }
}