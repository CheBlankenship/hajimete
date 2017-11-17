#!flask/bin/python
from dotenv import load_dotenv, find_dotenv
load_dotenv(find_dotenv())

from flask import Flask, render_template, redirect, request, jsonify
import pg
#from wiki_linkify import wiki_linkify
import os

db = pg.DB(
    dbname=os.environ.get('PG_DBNAME'),
    host=os.environ.get('PG_HOST'),
    user=os.environ.get('PG_USERNAME'),
    passwd=os.environ.get('PG_PASSWORD')
)
tmp_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'templates')
app = Flask('nakamura', template_folder=tmp_dir)

@app.route('/')
def home():
    return redirect('/summary')


@app.route('/summary')
def summary():
    queryData = db.query("select * from testschema.stores")
    if len(queryData) > 0:
        resultData = queryData.dictresult()
        return jsonify(resultData)
    else:
        return render_template(
             'placeholder.html'
        )


if __name__ == '__main__':
    app.run(debug=True)
