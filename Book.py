import csv
from itertools import tee
from Scraping import *


class Book:

    num_books = 0

    def __init__(self, title, author, quotes):
        self.title = title
        self.author = author
        self.quotes = quotes
        Book.num_books += 1

    def get_csv_writer():
        csv_file = open("Books.csv", "a")
        csv_writer = csv.writer(csv_file, lineterminator="\n")
        return csv_writer

    def get_csv_reader():
        csv_file = open("Books.csv", "r", encoding="utf-8")
        csv_reader = csv.DictReader(csv_file)
        return csv_reader

    def initialize_csv():
        writer_object = Book.get_csv_writer()
        writer_object.writerow(["Title", "Author", "Quote"])  # header

    def write_quotes_in_csv(self):
        writer_object = Book.get_csv_writer()
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
                    scraping.getTitle(c + 1), scraping.getAuthor(), scraping.getQuotes()
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

    def update_csv():
        # enter csv in write mode to delete existing stuff
        # make a backup of old csv file
        pass

    def set_books_from_csv():
        csv_reader = Book.get_csv_reader()
        books = []
        quotes = []
        length = 0

        for line in csv_reader:
            length += 1

        csv_reader = Book.get_csv_reader()
        csv_reader, csv_reader2 = tee(csv_reader)
        line1 = next(csv_reader)

        next(csv_reader2)  # at first, the iterator doesn't point at anything
        line2 = next(csv_reader2)

        while True:
            quotes.append(line1["Quote"])
            if line1["Title"] != line2["Title"]:
                books.append(Book(line1["Title"], line1["Author"], list(quotes)))
                quotes.clear()

            line1 = next(csv_reader)
            try:
                line2 = next(csv_reader2)
            except:
                quotes.append(line2["Quote"])  # last quote
                books.append(Book(line1["Title"], line1["Author"], list(quotes)))
                break

        for book in books:
            print(book.title, book.quotes)


Book.set_books_from_csv()
