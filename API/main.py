from fastapi import FastAPI, Path
import CSV
import json

dict = {}
for i, line in enumerate(CSV.csv_reader):
    dict[i] = line

app = FastAPI()


@app.get("/")  # right above the line below
def home():
    """gets everything"""
    return dict  # return dic


@app.get("/get-books")
def get_books():
    """gets the titles of all books"""
    c=0
    books_dict = {}
    for value_dict in dict.values():
        if value_dict['Title'] not in books_dict.values():
            books_dict[c] = value_dict["Title"]
            c += 1
    return books_dict


@app.get("/get-authors")
def get_authors():
    """gets author names"""
    c=0
    authors_dict = {}
    for value_dict in dict.values():
        if value_dict['Author'] not in authors_dict.values():
            authors_dict[c] = value_dict["Author"]
            c += 1
    return authors_dict

@app.get("/search-by-title")
def search_by_title(title: str):
    """Searches by title"""
    book_dict = {}
    c = 0
    for value_dict in dict.values():
        if value_dict["Title"] == title:
            book_dict[c] = value_dict
            c += 1
    return book_dict


@app.get("/search-by-author")
def search_by_author(author: str):
    """Searches by author"""
    book_dict = {}
    c = 0
    for value_dict in dict.values():
        if value_dict["Author"] == author:
            book_dict[c] = value_dict
            c += 1
    return book_dict

@app.get("/search-by-id")
def search_by_id(id: int):
    """Searches by id"""
    c = 0
    for index, book_dict in dict.items():
        if index == id:
            return book_dict
    