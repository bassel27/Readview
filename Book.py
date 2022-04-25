import csv
import os
from Scraping import *

class Book:
    def __init__(self, quotes, title, author):
        self.title = title
        self.author = author
        self.quotes = quotes

    @staticmethod
    def initializeCSV(CSVFile):
        writerObject = csv.writer(CSVFile)
        writerObject.writerow(["Title", "Author", "Quote"])  # header

    def writeCSV(self):
        CSVFile = open("books.csv", "a")
        if os.path.getsize("books.csv") == 0:
            Book.initializeCSV(CSVFile)
        writerObject = csv.writer(CSVFile)
        if self.quotes is not None:
            for quote in self.quotes:
                writerObject.writerow([self.title, self.author, quote])

    def updateBooks():
        scraping = Scraping()
        scraping.openWebDriver()
        scraping.fetchNotion()
        booksElements = scraping.getBooks()
        books = []

        for c, bookElement in enumerate(booksElements):
            scraping.openBook(bookElement)
            books.append(
                Book(scraping.getQuotes(), scraping.getTitle(c + 1), scraping.getAuthor())
            )
            scraping.closeBook()
            books[c].writeCSV()
            c += 1

        def deleteAndBegin():
            scraping = Scraping()
            scraping.fetchNotion()
            booksElements = scraping.getBooks()
            books = []

            for c, bookElement in enumerate(booksElements):
                scraping.openBook(bookElement)
                books.append(
                    Book(scraping.getQuotes(), scraping.getTitle(c + 1), scraping.getAuthor())
                )
                scraping.closeBook()
                books[c].writeCSV()
                c += 1

        def setBookFromCSV(self):
            self.quotes = []
            
