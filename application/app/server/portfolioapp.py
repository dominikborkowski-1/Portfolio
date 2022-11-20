from flask import Flask, render_template, request, url_for, redirect
from pymongo import MongoClient
import os

app=Flask(__name__)


CONNECTION_STRING=os.environ['MONGODB_URI']
client = MongoClient(CONNECTION_STRING)
db=client.flask_db
booksdb=db.booksdb
moviesdb=db.moviesdb
tvseriesdb=db.tvseriesdb

@app.route("/")
def home():
    return render_template("homepage.html")

@app.route("/books",methods=["GET","POST"])
def books():
    if request.method=="GET":
        all_books = booksdb.find()
    return render_template("books.html", booksall=all_books)

@app.route("/books/add",methods=["GET","POST"])
def booksadd():
    if request.method=="POST":
        booktitle = request.form['booktitle']
        author = request.form['author']
        bookstartdate = request.form['bookstartdate']
        bookfinishdate = request.form['bookfinishdate']
        bookrating = request.form['bookrating']
        bookdescription = request.form['bookdescription']
        booksdb.insert_one({'booktitle': booktitle, 'author': author, 'bookstartdate': bookstartdate, 'bookfinishdate': bookfinishdate, 'bookrating': bookrating, 'bookdescription': bookdescription})
        return redirect(url_for('booksadd'))

    all_books = booksdb.find()
    return render_template("booksadd.html", booksall=all_books)

@app.route("/books/search",methods=["GET","POST"])
def booksearch():
    if request.method=="POST":
        author = request.form['author']
        searchedbooks=booksdb.find({'author': author})
        return render_template("booksearch.html", booksearchresult=searchedbooks)
    return render_template("booksearch.html")


@app.route("/books/delete",methods=["GET","POST"])
def booksdelete():
    if request.method=="POST":
        booktitle = request.form['booktitle']
        author = request.form['author']
        booksdb.delete_one({'booktitle': booktitle, 'author': author})
        return redirect(url_for('booksdelete'))
    return render_template("booksdelete.html")

@app.route("/books/delete/all",methods=["POST"])
def booksdeleteall():
    if request.method=="POST":
        booksdb.delete_many({})
    return redirect(url_for('booksdelete'))


@app.route("/movies", methods=["GET","POST"])
def movies():
    if request.method=="GET":
        all_movies = moviesdb.find()
    return render_template("movies.html", moviesall=all_movies)

@app.route("/movies/add", methods=["GET","POST"])
def moviesadd():
    if request.method=="POST":
        movietitle = request.form['movietitle']
        moviedirector = request.form['moviedirector']
        watchdate = request.form['watchdate']
        movieactor = request.form['movieactor']
        movierating = request.form['movierating']
        moviedescription = request.form['moviedescription']
        moviesdb.insert_one({'movietitle': movietitle, 'moviedirector': moviedirector, 'watchdate': watchdate, 'movieactor': movieactor, 'movierating': movierating, 'moviedescription': moviedescription})
        return redirect(url_for('moviesadd'))

    all_movies = moviesdb.find()
    return render_template("moviesadd.html", moviesall=all_movies)

@app.route("/movies/search",methods=["GET","POST"])
def moviesearch():
    if request.method=="POST":
        moviedirector = request.form['moviedirector']
        searchedmovies=moviesdb.find({'moviedirector': moviedirector})
        return render_template("moviesearch.html", moviesearchresult=searchedmovies)
    return render_template("moviesearch.html")


@app.route("/movies/delete",methods=["GET","POST"])
def moviesdelete():
    if request.method=="POST":
        movietitle = request.form['movietitle']
        moviedirector = request.form['moviedirector']
        moviesdb.delete_one({'movietitle': movietitle, 'moviedirector': moviedirector})
        return redirect(url_for('moviesdelete'))
    return render_template("moviesdelete.html")

@app.route("/movies/delete/all",methods=["POST"])
def moviesdeleteall():
    if request.method=="POST":
        moviesdb.delete_many({})
    return redirect(url_for('moviesdelete'))

@app.route("/tvseries", methods=["GET","POST"])
def tvseries():
    if request.method=="GET":
        all_tvseries = tvseriesdb.find()
    return render_template("tvseries.html", tvseriesall=all_tvseries)

@app.route("/tvseries/add", methods=["GET","POST"])
def tvseriesadd():
    if request.method=="POST":
        tvtitle = request.form['tvtitle']
        tvdirector = request.form['tvdirector']
        tvstartdate = request.form['tvstartdate']
        tvfinishdate = request.form['tvfinishdate']
        tvactor = request.form['tvactor']
        tvrating = request.form['tvrating']
        tvdescription = request.form['tvdescription']
        tvseriesdb.insert_one({'tvtitle': tvtitle, 'tvdirector': tvdirector, 'tvstartdate': tvstartdate, 'tvfinishdate': tvfinishdate, 'tvactor': tvactor, 'tvrating': tvrating, 'tvdescription': tvdescription})
        return redirect(url_for('tvseriesadd'))

    all_tvseries = tvseriesdb.find()
    return render_template("tvseriesadd.html", tvseriesall=all_tvseries)

@app.route("/tvseries/search",methods=["GET","POST"])
def tvsearch():
    if request.method=="POST":
        tvdirector = request.form['tvdirector']
        searchedtvshows=tvseriesdb.find({'tvdirector': tvdirector})
        return render_template("moviesearch.html", tvsearchresult=searchedtvshows)
    return render_template("tvsearch.html")

@app.route("/tvseries/delete",methods=["GET","POST"])
def tvseriesdelete():
    if request.method=="POST":
        tvtitle = request.form['tvtitle']
        tvdirector = request.form['tvdirector']
        tvseriesdb.delete_one({'tvtitle': tvtitle, 'tvdirector': tvdirector})
        return redirect(url_for('tvseriesdelete'))
    return render_template("tvseriesdelete.html")

@app.route("/tvseries/delete/all",methods=["POST"])
def tvseriesdeleteall():
    if request.method=="POST":
        tvseriesdb.delete_many({})
    return redirect(url_for('tvseriesdelete'))

if __name__=="__main__":
    app.run(debug=True, host='0.0.0.0')

#testargocd
