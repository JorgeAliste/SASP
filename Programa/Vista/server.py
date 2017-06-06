from flask import *  # Se importa la librearia flask para levantar el servidor y manipular una WEB													# Se importa la libreria arxiv para utilizar el motor de busqueda que incorpora
from googleapiclient.discovery import build
import pymysql.cursors

#Connect to the database
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             db='sasp',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)


cseId = "015171683571889140877:1zvmx85stto"
apiKey = "AIzaSyC1D9EE0r9_4qmmBXrttY15ZnSfAQBLJ-Q" 
#apiKey = "AIzaSyC_4S3DH_pnusbbLswK18axTtvGtA40Qf8" RESPALDO

def calificar_enlace(link, calificacion, tipo):
    return
def filtrar_resultados(array_resultados, tipo):
    # Los resultados seran una lista con título y link
    # 1) Ver si el link esta en la base de datos.
    #   Si no esta, agregar a la bdd con calificación igual a 3 para todos los tipos
    #   y agregar al arreglo ordenado

    # 2) Si el link esta en la BDD, lo agregamos al arreglo ordenado solo si corresponde al tipo que busco
    return

def google_search(search_term, api_key, cse_id, **kwargs):
    service = build("customsearch", "v1", developerKey=api_key)
    res = service.cse().list(q=search_term, cx=cse_id, **kwargs).execute()
    return res['items']

def agregar_sitios(palabra):
    lista_sitios = []
    resultados_busqueda_1 = google_search(palabra, apiKey, cseId, num=10, filter='1', start=1)  # num: cuantos resultados mostrar por cada pagina de resultados, max 10;
    resultados_busqueda_2 = google_search(palabra, apiKey, cseId, num=10, filter='1', start=11)
    for i in resultados_busqueda_1:
        lista_sitios.append((i['title'], i['link']))
    for j in resultados_busqueda_2:
        lista_sitios.append((j['title'], j['link']))    
    return lista_sitios


app = Flask(__name__)  # Se crea la clase aplicacion a mostrar en el navegador


@app.route('/')  # Los elementos "route" definen las pestanias de la aplicacion
def login():  # Se define el inicio de la aplicacion
    return render_template('index.html')  # Se define default como la pagina de incicio de la aplicacion


@app.route('/Resultados_busqueda', methods=['POST',
                               'GET'])  # La pestania "result" al ser accedida tomara los elementos enviados desde el origen
def result():
    if request.method == 'POST':  # Se verifica que tipo de paso de datos se ha utilizado
        busqueda_usuario = request.form['texto']
        lista = agregar_sitios(busqueda_usuario)
        return render_template("Resultados_busqueda.html",
                               result=lista)  # Se envian los datos a la pestania de resultados donde estos seran mostrados
    # Por lo anterior se redirige al usuario a la pestania de resultados

if __name__ == '__main__':
    app.run(debug=True)
