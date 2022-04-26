import csv
import os
from Scraping import *


class Book:
    def __init__(self, quotes, title, author):
        self.title = title
        self.author = author
        self.quotes = quotes

    def get_writer_object():
        csv_file = open("Books.csv", "a")
        writer_object = csv.writer(csv_file, lineterminator="\n")
        return writer_object

    def initialize_csv():
        writer_object = Book.get_writer_object()
        writer_object.writerow(["Title", "Author", "Quote"])  # header

    def write_quotes_in_csv(self):
        writer_object = Book.get_writer_object()
        if self.quotes is not None:
            for quote in self.quotes:
                writer_object.writerow([self.title, self.author, quote])

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

    def set_books_from_notion():
        Book.initialize_csv()
        Book.fill_csv(Book.get_books())

    def set_books_from_csv():
        pass


Book.set_books_from_notion()
