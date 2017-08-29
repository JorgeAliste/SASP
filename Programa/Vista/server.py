from flask import *
from googleapiclient.discovery import build
import pymysql.cursors

#Credenciales para usar el motor de busqueda
cseId = "015171683571889140877:1zvmx85stto"
apiKey = "AIzaSyC1D9EE0r9_4qmmBXrttY15ZnSfAQBLJ-Q" 
#apiKey = "AIzaSyC_4S3DH_pnusbbLswK18axTtvGtA40Qf8" RESPALDO POR SI FALLA LA PRIMERA

#Base de datos
usuario_bd = "root"
passwd_bd = ""

# Función que verifica la existencia de un enlace en la base de datos
def verificar_existencia(link):
    # Conectando a la base de datos
    connection = pymysql.connect(host='localhost',
                                 user=usuario_bd,
                                 password=passwd_bd,
                                 db='sasp',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    try:
        with connection.cursor() as cursor:
            # Verificar si existe el enlace
            sql = "SELECT * FROM `Enlace` WHERE `Link`= %s"
            cursor.execute(sql, link)
            result = cursor.fetchone()
        if result == None:
            # Retorna 0 si no encuentra el link
            return 0
        else:
            # Retorna uno si encuentra el link
            return 1
    finally:
        connection.close()


#Tipo: 0 -> acomodador 1-> asimilador 2-> covergente 3-> divergente
def calificar_enlace(link, calificacion, tipo, mail, comentario = None):
    # Insertar en tabla calificaciones
    connection = pymysql.connect(host='localhost',
                                 user=usuario_bd,
                                 password=passwd_bd,
                                 db='sasp',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    if tipo=="acomodador": 
        tipo_busqueda = 0
    elif tipo=="asimilador":
        tipo_busqueda = 1
    elif tipo=="convergente":
        tipo_busqueda = 2
    elif tipo=="divergente":
        tipo_busqueda = 3    

    try:
        with connection.cursor() as cursor:
            # Insertando nueva calificacion
            sql = "INSERT INTO `calificacion` (`Mail`, `Link`, `Nota`, `Comentario`, `Tipo`) VALUES (%s, %s, %s, %s, %s)"
            cursor.execute(sql, (mail, link, calificacion, comentario, tipo_busqueda))
        connection.commit()

        with connection.cursor() as cursor:
            # Actualizando calificacion del link
            if tipo_busqueda == 0:
                Prom = "CPromAcomodador"
                sql = "UPDATE `Enlace` SET `CPromAcomodador` = (SELECT (SELECT (SELECT SUM(`Nota`) from `calificacion` where `Link` = %s) + (select(%s)))/(select (select count(`Nota`) from `calificacion` where `link` = %s) + (select %s))) where `Link` = %s"
            elif tipo_busqueda == 1:
                Prom = "CPromAsimilador"
                sql = "UPDATE `Enlace` SET `CPromAsimilador` = (SELECT (SELECT (SELECT SUM(`Nota`) from `calificacion` where `Link` = %s) + (select(%s)))/(select (select count(`Nota`) from `calificacion` where `link` = %s) + (select %s))) where `Link` = %s"
            elif tipo_busqueda == 2:
                Prom = "CPromConvergente"
                sql = "UPDATE `Enlace` SET `CPromConvergente` = (SELECT (SELECT (SELECT SUM(`Nota`) from `calificacion` where `Link` = %s) + (select(%s)))/(select (select count(`Nota`) from `calificacion` where `link` = %s) + (select %s))) where `Link` = %s"
            elif tipo_busqueda == 3:
                Prom = "CPromDivergente"
                sql = "UPDATE `Enlace` SET `CPromDivergente` = (SELECT (SELECT (SELECT SUM(`Nota`) from `calificacion` where `Link` = %s) + (select(%s)))/(select (select count(`Nota`) from `calificacion` where `link` = %s) + (select %s))) where `Link` = %s"

            cursor.execute(sql, (link, 3, link, 1, link))
        connection.commit()
    finally:
        connection.close()
    return 1

def filtrar_resultados(array_resultados, tipo):
    if tipo == 0:
        Prom = "CPromAcomodador"
    elif tipo == 1:
        Prom = "CPromAsimilador"
    elif tipo == 2:
        Prom = "CPromConvergente"
    elif tipo == 3:
        Prom = "CPromDivergente"


    filtrado = []
    # Los resultados seran una lista con título y link
    # 1) Ver si el link esta en la base de datos.
    #   Si no esta, agregar a la bdd con calificación igual a 3 para todos los tipos
    #   y agregar al arreglo ordenado
    for i in array_resultados:
        # Ver si el link está en la base de datos

        titulo = i[0]
        link = i[1]
        temp1 = link
        temp2 = temp1.split(".")
        fTipo = temp2[len(temp2) - 1]
        if len(fTipo) > 5:
            fTipo = "html"

        calificacion = 3.0
        # Caso en que n ose encuentra en la base de datos
        if verificar_existencia(i[1]) == 0:
            #Insertar en tabla enlace
            connection = pymysql.connect(host = 'localhost',
                                         user =usuario_bd,
                                         password =passwd_bd,
                                         db='sasp',
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            try:
                with connection.cursor() as cursor:
                    # Insertando nuevo enlace en la base de datos
                    sql = "INSERT INTO `Enlace` (`Link`, `Titulo`, `Tipo`) VALUES (%s, %s, %s)"
                    cursor.execute(sql, (link, titulo, fTipo))
                    sql = "INSERT INTO `Calificacion` (`Mail`, `Link`, `Nota`, `Comentario`, `Tipo`) VALUES (%s, %s, %s, %s, )"
                connection.commit()
            finally:
                connection.close()
        # 2) Si el link esta en la BDD, lo agregamos al arreglo ordenado solo si corresponde al tipo que busco
        else:
            connection = pymysql.connect(host='localhost',
                                         user=usuario_bd,
                                         password=passwd_bd,
                                         db='sasp',
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            try:
                with connection.cursor() as cursor:
                    if tipo == 0:
                        Prom = "CPromAcomodador"
                        sql = "SELECT `Titulo`, `Link`, `CPromAcomodador` FROM `Enlace` WHERE `Link` = %s"
                    elif tipo == 1:
                        Prom = "CPromAsimilador"
                        sql = "SELECT `Titulo`, `Link`, `CPromAsimilador` FROM `Enlace` WHERE `Link` = %s"
                    elif tipo == 2:
                        Prom = "CPromConvergente"
                        sql = "SELECT `Titulo`, `Link`, `CPromConvergente` FROM `Enlace` WHERE `Link` = %s"
                    elif tipo == 3:
                        Prom = "CPromDivergente"
                        sql = "SELECT `Titulo`, `Link`, `CPromDivergente` FROM `Enlace` WHERE `Link` = %s"
                    cursor.execute(sql, link)
                    result = cursor.fetchone()
                    titulo = result["Titulo"]
                    link = result["Link"]
                    calificacion = round(result[Prom], 1)

            finally:
                connection.close()

        filtrado.append((titulo, link, calificacion))
        mergeSort(filtrado)
        filtrado = filtrado[::-1]

    return filtrado

def google_search(search_term, api_key, cse_id, **kwargs):
    service = build("customsearch", "v1", developerKey = api_key)
    res = service.cse().list(q=search_term, cx=cse_id, **kwargs).execute()
    return res['items']

def agregar_sitios(palabra, tipo):
    lista_sitios = []

    if tipo=="acomodador": #aca se pueden definir los criterios de busqueda para cada tipo
        criterio_busqueda = ""
        tipo_busqueda = 0
    elif tipo=="asimilador":
        criterio_busqueda = ""
        tipo_busqueda = 1
    elif tipo=="convergente":
        criterio_busqueda = ""
        tipo_busqueda = 2
    elif tipo=="divergente":
        criterio_busqueda = ""
        tipo_busqueda = 3    

    resultados_busqueda_1 = google_search(palabra + criterio_busqueda, apiKey, cseId, num=10, filter='1', start=1)
    #resultados_busqueda_2 = google_search(palabra + criterio_busqueda, apiKey, cseId, num=10, filter='1', start=11)
    for i in resultados_busqueda_1:
        lista_sitios.append((i['title'], i['link']))

    #for j in resultados_busqueda_2:
    #    lista_sitios.append((j['title'], j['link']))

    lista_sitios = filtrar_resultados(lista_sitios, tipo_busqueda)
    return lista_sitios

def mergeSort(alist):
    if len(alist)>1:
        mid = len(alist)//2
        lefthalf = alist[:mid]
        righthalf = alist[mid:]

        mergeSort(lefthalf)
        mergeSort(righthalf)

        i=0
        j=0
        k=0
        while i < len(lefthalf) and j < len(righthalf):

            if lefthalf[i][2] < righthalf[j][2]:
                alist[k]=lefthalf[i]
                i=i+1
            else:
                alist[k]=righthalf[j]
                j=j+1
            k=k+1

        while i < len(lefthalf):
            alist[k]=lefthalf[i]
            i=i+1
            k=k+1

        while j < len(righthalf):
            alist[k]=righthalf[j]
            j=j+1
            k=k+1

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/Resultados_busqueda', methods=['POST',
                               'GET'])
def result():
    if request.method == 'POST':
        busqueda_usuario = request.form['texto']
        tipo_busqueda = request.form['tipo_busqueda']
        lista = agregar_sitios(busqueda_usuario, tipo_busqueda)
        return render_template("Resultados_busqueda.html",
                               result=lista, type= str(tipo_busqueda))

@app.route('/Calificar', methods=['POST',
                               'GET'])
def calificar():
    if request.method == 'POST':
        mail = request.form['mail-calificar']
        enlace_calificar = request.form['enlace-calificar']
        numero_estrellas = request.form['rating']
        tipo_busqueda = request.form['tipo_busqueda']

        if int(numero_estrellas) > 5:
            numero_estrellas = '5'

        elif int(numero_estrellas) < 1:
            numero_estrellas = '1'

        if calificar_enlace(enlace_calificar, numero_estrellas, tipo_busqueda, mail) == 1:
            mensaje="Calificacion exitosa"
        else:
            mensaje="Calificacion fallida"

    return render_template("Calificar.html", result=mensaje)


if __name__ == '__main__':
    app.run(debug=True)

