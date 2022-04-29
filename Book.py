from itertools import tee

from Scraping import *
import CSV


class Book:
    def __init__(self, title, author, quotes):
        self.title = title
        self.author = author
        self.quotes = quotes

    def get_books():
        scraping = Scraping()
        scraping.fetch_notion()
        booksElements = scraping.get_books_elements()
        books = []

        for c, bookElement in enumerate(booksElements):
            scraping.open_book(bookElement)
            books.append(
                Book(
                    scraping.get_title(c + 1),
                    scraping.get_author(),
                    scraping.getQuotes(),
                )
            )
            scraping.close_book()
        return books  # returns a list of books

    def set_books_from_notion():
        books = Book.get_books()
        CSV.initialize_csv()
        for book in books:
            for quote in book.quotes:
                CSV.write_record_in_csv(book.title, book.author, quote)
        CSV.close_file()

    def update_csv():
        # enter csv in write mode to delete existing stuff
        # make a backup of old csv file
        pass

    def set_books_from_csv():
        books = []
        quotes = []
        length = 0
        for _ in CSV.csv_reader:  # _ is a general purpose "throwaway" variable name
            length += 1
        CSV.reset_csv_reader()
        csv_reader, csv_reader2 = tee(CSV.csv_reader)
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
        CSV.reset_csv_reader()
        for book in books:
            print(book.title, book.quotes)

        CSV.close_file()


Book.set_books_from_csv()
