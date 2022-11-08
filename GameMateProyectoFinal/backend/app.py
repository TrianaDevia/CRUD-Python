from flask import Flask,render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

# Application initializations
app = Flask(__name__)

app.config['MYSQL_HOST'] = "localhost"
app.config['MYSQL_PORT'] = "3308"
app.config['MYSQL_USER'] = "root"
app.config['MYSQL_PASSWORD'] = "Tito1497." 
app.config['MYSQL_DB'] = "gamemate"
mysql=MySQL(app)

@app.route('/')
def Perfil():
    return render_template('index.html')

@app.route('/crear_perfil', methods=['POST'])
def crear_perfil():
    if request.method=='POST':
        nombre=request.form['nombre']
        apellido=request.form['apellido']
        #fecha_nac=request.form['fecha_nac']
        provincia=request.form['provincia']
        disp_horaria=request.form['disp_horaria']
        email=request.form['email']
        descripcion=request.form['descripcion']
        cur=mysql.connection.cursor()
        cur.execute('INSERT INTO usuarios (nombre,apellido,fecha_nac,provincia,disp_horaria,email,descripcion)VALUES (%s,%s,%s,%s,%s,%s,)',(nombre,apellido,
        #fecha_nac,
        provincia,disp_horaria,email,descripcion))
        mysql.connection.commit()
        flash('Información agregada satisfactoriamente')
        return redirect(url_for('Index'))
        

@app.route('/modificar_perfil')
def modificar_perfil():
    return 'modificar perfil'

@app.route('/borrar_perfil')
def delete():
    return 'borrar perfil'


if __name__=="__main__":
    app.run(port=3000, debug=True)