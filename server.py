#!flask/bin/python
from flask import Flask, render_template, request, redirect, session, flash, jsonify
import pg
import os



#DataBase Connection
app = Flask(__name__)
db = pg.DB(
       host='nakamura.c2iqmtffajql.us-east-1.rds.amazonaws.com',
       user='root',
       passwd='grandmava',
       dbname='nakamuradb'
)

@app.route('/')
def init_page():
    init_value = "Hola to py server!!!"
    return jsonify(init_value)

@app.route('/initReturn')
def get_json():
    all_products = db.query("SELECT * FROM testschema.stores").dictresult()
    return jsonify(all_products)

if __name__ == '__main__':
    app.run(debug=True)
