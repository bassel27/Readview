import csv
import os
from Scraping import *


class Book:
    def __init__(self, quotes, title, author):
        self.title = title
        self.author = author
        self.quotes = quotes

    def initialize_csv():
        csv_file = open("Books.csv", "a")
        writerObject = csv.writer(csv_file, lineterminator="\n")
        writerObject.writerow(["Title", "Author", "Quote"])  # header

    def write_quotes_in_csv(self):
        csv_file = open("Books.csv", "a")
        writerObject = csv.writer(csv_file, lineterminator="\n")
        if self.quotes is not None:
            for quote in self.quotes:
                writerObject.writerow([self.title, self.author, quote])

    def get_books():
        scraping = Scraping()
        scraping.fetch_notion()
        booksElements = scraping.get_books_elements()
        books = []

        for c, bookElement in enumerate(booksElements):
            scraping.open_book(bookElement)
            books.append(
                Book(
                    scraping.getQuotes(), scraping.getTitle(c + 1), scraping.getAuthor()
                )
            )
            scraping.close_book()

        return books

    def fill_csv(books):
        for c in range(len(books)):
            books[c].write_quotes_in_csv()

    def initialize_books_from_notion():
        Book.initialize_csv()
        Book.fill_csv(Book.get_books())

    def initialize_book_from_csv():
        pass


Book.initialize_books_from_notion()
